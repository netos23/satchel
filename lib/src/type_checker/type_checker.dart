import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';

import '../antlr/StellaLexer.dart';
import '../antlr/StellaParser.dart';
import 'model/stella_type_report.dart';
import 'visitor/stella_type_visitor.dart';
import 'visitor/top_level_function_visitor.dart';

void ensureInitialized() {
  StellaLexer.checkVersion();
  StellaParser.checkVersion();
}

StellaTypeReport? buildStellaTypeReport(InputStream input) {
  final lexer = StellaLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = StellaParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());

  final root = parser.start_Program();
  try {
    final context = root.accept(TopLevelFunctionVisitor())!;

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

    return root.accept(StellaTypeVisitor(context));
  } on ErrorTypeReport catch (error) {
    return error;
  }
}
