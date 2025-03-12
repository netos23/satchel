import '../antlr/StellaParser.dart';
import '../antlr/StellaParserBaseVisitor.dart';
import 'stella_types.dart';

class StellaTypesContextCollectorVisitor
    extends StellaParserBaseVisitor<StellaType> {
  @override
  StellaType? aggregateResult(
    StellaType? aggregate,
    StellaType? nextResult,
  ) {
    return nextResult ?? aggregate;
  }

  @override
  StellaType visitTypeBool(TypeBoolContext ctx) {
    return const Bool();
  }

  @override
  StellaType visitTypeNat(TypeNatContext ctx) {
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
      left: ctx.left!.accept(this)!,
      right: ctx.right!.accept(this)!,
    );
  }

  @override
  StellaType visitTypeTuple(TypeTupleContext ctx) {
    return TypeTuple(
      types: ctx.types
          .map((ctx) => ctx.accept(this))
          .whereType<StellaType>()
          .toList(),
    );
  }

  @override
  StellaType visitTypeRecord(TypeRecordContext ctx) {
    return TypeRecord(types: {
      for (final t in ctx.fieldTypes) t.label!.text!: t.type_!.accept(this)!,
    });
  }

  @override
  StellaType? visitDeclFun(DeclFunContext ctx) {
    throw UnimplementedError();
  }
}
