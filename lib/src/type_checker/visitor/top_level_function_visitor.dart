import 'package:satchel/src/type_checker/model/stella_types.dart';
import 'package:satchel/src/type_checker/visitor/stella_types_mapper_visitor.dart';

import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_types_context.dart';

class TopLevelFunctionVisitor
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
  StellaTypesContext visitDeclFun(DeclFunContext ctx) {
    final args = ctx.paramDecls
        .map((ctx) => ctx.accept(StellaTypesMapperVisitor()))
        .whereType<StellaType>()
        .toList(growable: false);

    final returnType = ctx.returnType?.accept(
      StellaTypesMapperVisitor(),
    );

    return StellaTypesContext.single(
      ctx.name!.text!,
      Func(args: args, returnType: returnType ?? const Unit()),
    );
  }
}
