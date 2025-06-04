import 'dart:collection';

import 'package:antlr4/src/tree/src/tree.dart';

import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_type_report.dart';
import '../model/stella_types.dart';
import '../model/stella_types_context.dart';
import 'stella_reconstruction_visitor.dart';
import 'stella_type_visitor.dart';

class TopLevelContextVisitor
    extends StellaParserBaseVisitor<StellaTypesContext> {
  TopLevelContextVisitor();

  @override
  StellaTypesContext defaultResult() {
    return StellaTypesContext.root();
  }

  @override
  StellaTypesContext? aggregateResult(
    StellaTypesContext? aggregate,
    StellaTypesContext? nextResult,
  ) {
    return aggregate?.merge(nextResult) ?? nextResult;
  }


  @override
  StellaTypesContext? visitAnExtension(AnExtensionContext ctx) {
    return StellaTypesContext.extensions(
      ctx.extensionNames
          .map((t)=> t.text!)
          .map((ext) => LanguageFeatures.from(ext))
          .whereType<LanguageFeatures>()
          .toSet(),
    );
  }

  @override
  StellaTypesContext visitDeclFun(DeclFunContext ctx) {
    final args = ctx.paramDecls
        .map((ctx) => ctx.accept(StellaTypeVisitor()))
        .whereType<StellaTypeReport>()
        .toList(growable: false);

    if (args.whereType<ErrorTypeReport>().firstOrNull case final error?) {
      throw error;
    }

    final returnType = ctx.returnType!.accept(StellaTypeVisitor());

    if (returnType is ErrorTypeReport) {
      throw returnType;
    }

    return StellaTypesContext.single(
      ctx.name!.text!,
      Func(
        args: args.map((t) => t.typeOrNull).whereType<StellaType>().toList(),
        returnType: returnType?.typeOrNull ?? const Unit(),
      ),
    );
  }

  @override
  StellaTypesContext? visitDeclExceptionType(DeclExceptionTypeContext ctx) {
    final type = ctx.exceptionType!.accept(StellaTypeVisitor())!;

    return StellaTypesContext.exception(TypeExceptionContext(type.typeOrNull!));
  }

  @override
  StellaTypesContext? visitDeclExceptionVariant(
    DeclExceptionVariantContext ctx,
  ) {
    final name = ctx.name!.text!;
    final type = ctx.variantType!.accept(StellaTypeVisitor())!;

    return StellaTypesContext.exception(
      VariantExceptionContext(
        TypeVariant(types: LinkedHashMap.of({name: type.typeOrNull!})),
      ),
    );
  }

  static ParseTreeVisitor<StellaTypesContext> fromContext(
    StellaTypesContext context,
  ) {
    if (context.languageFeatures.contains(
      LanguageFeatures.typeReconstruction,
    )) {
      return TopLevelReconstructContextVisitor();
    }

    return TopLevelContextVisitor();
  }
}

class TopLevelReconstructContextVisitor
    extends StellaParserBaseVisitor<StellaTypesContext> {
  @override
  StellaTypesContext defaultResult() {
    return StellaTypesContext.root();
  }

  @override
  StellaTypesContext? aggregateResult(
    StellaTypesContext? aggregate,
    StellaTypesContext? nextResult,
  ) {
    return aggregate?.merge(nextResult) ?? nextResult;
  }


  @override
  StellaTypesContext? visitAnExtension(AnExtensionContext ctx) {
    return StellaTypesContext.extensions(
      ctx.extensionNames
          .map((t)=> t.text!)
          .map((ext) => LanguageFeatures.from(ext))
          .whereType<LanguageFeatures>()
          .toSet(),
    );
  }

  @override
  StellaTypesContext visitDeclFun(DeclFunContext ctx) {
    final args = ctx.paramDecls
        .map((ctx) => ctx.accept(StellaReconstructionTypeVisitor()))
        .whereType<StellaTypeReport>()
        .toList(growable: false);

    if (args.whereType<ErrorTypeReport>().firstOrNull case final error?) {
      throw error;
    }

    final returnType = ctx.returnType!.accept(StellaReconstructionTypeVisitor());

    if (returnType is ConstraintErrorTypeReport) {
      throw returnType;
    }

    return StellaTypesContext.single(
      ctx.name!.text!,
      Func(
        args: args.map((t) => t.typeOrNull).whereType<StellaType>().toList(),
        returnType: returnType?.typeOrNull ?? const Unit(),
      ),
    );
  }

  @override
  StellaTypesContext? visitDeclExceptionType(DeclExceptionTypeContext ctx) {
    final type = ctx.exceptionType!.accept(StellaReconstructionTypeVisitor())!;

    return StellaTypesContext.exception(TypeExceptionContext(type.typeOrNull!));
  }

  @override
  StellaTypesContext? visitDeclExceptionVariant(
    DeclExceptionVariantContext ctx,
  ) {
    final name = ctx.name!.text!;
    final type = ctx.variantType!.accept(StellaReconstructionTypeVisitor())!;

    return StellaTypesContext.exception(
      VariantExceptionContext(
        TypeVariant(types: LinkedHashMap.of({name: type.typeOrNull!})),
      ),
    );
  }
}
