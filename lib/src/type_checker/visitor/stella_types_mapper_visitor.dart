import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_types.dart';

class StellaTypesMapperVisitor extends StellaParserBaseVisitor<StellaType> {
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
  StellaType visitTypeFun(TypeFunContext ctx) {
    return Func(
      args: ctx.paramTypes
          .map((ctx) => ctx.accept(this))
          .whereType<StellaType>()
          .toList(),
      returnType: ctx.returnType!.accept(this)!,
    );
  }

  @override
  StellaType visitTypeForAll(TypeForAllContext ctx) {
    return TypeForAll(
      types: ctx.types.map((t) => t.text).whereType<String>().toList(),
      type: ctx.type_!.accept(this)!,
    );
  }

  @override
  StellaType visitTypeRec(TypeRecContext ctx) {
    return TypeRec(
      variable: ctx.var_!.text!,
      type: ctx.type_!.accept(this)!,
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
    return TypeRecord(
      types: {
        for (final t in ctx.fieldTypes) t.label!.text!: t.type_!.accept(this)!,
      },
    );
  }

  @override
  StellaType visitTypeVariant(TypeVariantContext ctx) {
    return TypeVariant(
      types: {
        for (final t in ctx.fieldTypes) t.label!.text!: t.type_!.accept(this)!,
      },
    );
  }

  @override
  StellaType visitTypeList(TypeListContext ctx) {
    return TypeList(
      type: ctx.type_!.accept(this)!,
    );
  }

  @override
  StellaType visitTypeUnit(TypeUnitContext ctx) {
    return const Unit();
  }

  @override
  StellaType visitTypeTop(TypeTopContext ctx) {
    return const Top();
  }

  @override
  StellaType visitTypeBottom(TypeBottomContext ctx) {
    return const Bottom();
  }

  @override
  StellaType visitTypeAuto(TypeAutoContext ctx) {
    return const Auto();
  }

  @override
  StellaType visitTypeVar(TypeVarContext ctx) {
    return TypeVar(ctx.name!.text!);
  }

  @override
  StellaType visitTypeParens(TypeParensContext ctx) {
    return TypeParens(ctx.type_!.accept(this)!);
  }
}
