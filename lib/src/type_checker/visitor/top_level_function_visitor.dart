

import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_type_report.dart';
import '../model/stella_types.dart';
import '../model/stella_types_context.dart';
import 'stella_type_visitor.dart';

class TopLevelFunctionVisitor
    extends StellaParserBaseVisitor<StellaTypesContext> {

  TopLevelFunctionVisitor();

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
  StellaTypesContext visitDeclFun(DeclFunContext ctx) {
    final args = ctx.paramDecls
        .map((ctx) => ctx.accept(StellaTypeVisitor()))
        .whereType<StellaTypeReport>()
        .toList(growable: false);

    if (args.whereType<ErrorTypeReport>().firstOrNull case final error?) {
      throw error;
    }


    final returnType = ctx.returnType!.accept(
      StellaTypeVisitor(),
    );


    if(returnType is ErrorTypeReport){
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
}
