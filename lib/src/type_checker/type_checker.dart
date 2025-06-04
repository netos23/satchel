import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';
import 'package:satchel/src/type_checker/types/constrains_unifier.dart';
import 'package:satchel/src/type_checker/visitor/language_feature_visitor.dart';

import '../antlr/StellaLexer.dart';
import '../antlr/StellaParser.dart';
import 'model/stella_type_report.dart';
import 'model/stella_types.dart';
import 'visitor/stella_reconstruction_visitor.dart';
import 'visitor/stella_type_visitor.dart';
import 'visitor/top_level_context_visitor.dart';

void ensureInitialized() {
  StellaLexer.checkVersion();
  StellaParser.checkVersion();
}

sealed class TypeChecker {
  final StellaTypesContext context;

  factory TypeChecker.of(StellaTypesContext context) {
    final features = context.languageFeatures;
    if (features.contains(LanguageFeatures.typeReconstruction)) {
      return ReconstructTypeChecker(context);
    }

    return BaseTypeChecker(context);
  }

  TypeChecker(this.context);

  StellaTypeReport? typeCheck(Start_ProgramContext ctx);
}

final class BaseTypeChecker extends TypeChecker {
  BaseTypeChecker(super.context);

  @override
  StellaTypeReport? typeCheck(Start_ProgramContext ctx) {
    return ctx.accept(StellaTypeVisitor(context));
  }
}

final class ReconstructTypeChecker extends TypeChecker {
  ReconstructTypeChecker(super.context);

  @override
  ConstraintStellaTypeReport? typeCheck(Start_ProgramContext ctx) {
    final report = ctx.accept(StellaReconstructionTypeVisitor(context));

    final constraints = report?.constrains.toSet() ?? {};
    final unifier = ConstrainsUnifier();

    return switch (report) {
      ConstraintGotTypeReport() =>
        unifier.unify(constraints)
            ? report
            : ConstraintErrorTypeReport(
                typesContext: report.typesContext,
                errorCode: StellaTypeError.errorOccursCheckInfiniteType,
                constrains: [],
              ),
      ConstraintErrorTypeReport() => report,
      _ => report,
    };
  }
}

StellaTypeReport? buildStellaTypeReport(InputStream input) {
  final lexer = StellaLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = StellaParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());

  final root = parser.start_Program();
  try {
    StellaTypesContext context = root.accept(LanguageFeatureVisitor())!;

    context = root.accept(TopLevelContextVisitor.fromContext(context))!;

    final entryPoint = context['main'];
    if (entryPoint is! Func) {
      return ErrorTypeReport(
        typesContext: context,
        errorCode: StellaTypeError.missingMain,
        message: 'Missing main function',
      );
    }

    if (entryPoint.args.singleOrNull == null) {
      return ErrorTypeReport(
        typesContext: context,
        errorCode: StellaTypeError.incorrectArityOfMain,
        message: 'Main function must have one param',
      );
    }

    final features = context.languageFeatures;
    final exceptionContext = context.exceptionContext;
    if ((features.contains(LanguageFeatures.exceptions) ||
            features.contains(LanguageFeatures.variantExceptions)) &&
        !exceptionContext.hasDeclaration) {
      return ErrorTypeReport(
        typesContext: context,
        errorCode: StellaTypeError.exceptionNotDeclared,
        message: 'Exception  must have one param',
      );
    }
    return TypeChecker.of(context).typeCheck(root);
  } on ErrorTypeReport catch (error) {
    return error;
  }
}
