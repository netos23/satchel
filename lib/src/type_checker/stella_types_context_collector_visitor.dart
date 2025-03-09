import 'package:satchel/src/type_checker/stella_types_context.dart';

import '../antlr/StellaParser.dart';
import '../antlr/StellaParserBaseVisitor.dart';

class StellaTypesContextCollectorVisitor
    extends StellaParserBaseVisitor<StellaTypesContext> {
  @override
  StellaTypesContext defaultResult() {
    return StellaTypesContext.root();
  }

  @override
  StellaTypesContext? aggregateResult(
    StellaTypesContext? aggregate,
    StellaTypesContext? nextResult,
  ) =>
      aggregate?.merge(nextResult);

  @override
  StellaTypesContext? visitDeclFun(DeclFunContext ctx) {
    throw UnimplementedError();
  }
}
