import '../antlr/StellaParser.dart';
import '../antlr/StellaParserBaseVisitor.dart';
import 'stella_types.dart';

class StellaTypesContextCollectorVisitor
    extends StellaParserBaseVisitor<StellaType> {
  @override
  StellaType defaultResult() {
    return StellaTypesContext.root();
  }

  @override
  StellaType? aggregateResult(
    StellaType? aggregate,
    StellaType? nextResult,
  ) {
    return nextResult ?? nextResult;
  }
      
  @override
  StellaType visitTypeBool(TypeBoolContext ctx){
    return const Bool();
  }

  @override
  StellaType visitTypeNat(TypeNatContext ctx){
    return const Nat();
  }

  @override
  StellaType visitTypeRef(TypeRefContext ctx) {
    return TypeRef(
      type: ctx.type_!.accept(this)!,
    );
  }

  @override
  StellaType visitTypeSum(TypeSumContext ctx) {
    return TypeSum(
      left: ctx.left?.accept(this),
      right: ctx.right?.accept(this),
    );
  }

  @override
  StellaType visitTypeTuple(TypeTupleContext ctx) {
    throw UnimplementedError();
  }

  @override
  StellaType? visitDeclFun(DeclFunContext ctx) {
    throw UnimplementedError();
  }
}