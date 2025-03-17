import 'package:collection/collection.dart';
import 'package:satchel/src/type_checker/visitor/top_level_function_visitor.dart';
import 'package:satchel/src/util/extensions.dart';
import 'package:satchel/src/util/iterable.dart';

import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_type_report.dart';
import '../model/stella_types.dart';
import '../model/stella_types_context.dart';

typedef ContextBuilder = StellaTypeReport? Function(StellaTypesContext);

class StellaTypeVisitor extends StellaParserBaseVisitor<StellaTypeReport> {
  StellaTypesContext context;

  StellaTypeVisitor([this.context = const StellaTypesContext()]);

  @override
  StellaTypeReport? aggregateResult(
    StellaTypeReport? aggregate,
    StellaTypeReport? nextResult,
  ) {
    if (nextResult is ErrorTypeReport) {
      return nextResult;
    }

    return aggregate ?? nextResult;
  }

  StellaTypeReport? withContext(ContextBuilder builder) {
    final originalContext = context;

    final copyContext = context = originalContext.clone();
    final res = builder(copyContext);
    context = originalContext;

    return res;
  }

  @override
  StellaTypeReport visitTypeBool(TypeBoolContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }

  @override
  StellaTypeReport visitTypeNat(TypeNatContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
    );
  }

  @override
  StellaTypeReport visitTypeRef(TypeRefContext ctx) {
    final typeReport = ctx.type_!.accept(this)!;

    if (typeReport is ErrorTypeReport) {
      return typeReport;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeRef(
        type: typeReport.typeOrNull!,
      ),
    );
  }

  @override
  StellaTypeReport visitTypeSum(TypeSumContext ctx) {
    final left = ctx.left!.accept(this)!;
    final right = ctx.right!.accept(this)!;

    if (left is ErrorTypeReport) {
      return left;
    }

    if (right is ErrorTypeReport) {
      return right;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeSum(
        left: left.typeOrNull!,
        right: right.typeOrNull!,
      ),
    );
  }

  @override
  StellaTypeReport visitTypeFun(TypeFunContext ctx) {
    final args = ctx.paramTypes
        .map((ctx) => ctx.accept(this))
        .whereType<StellaTypeReport>()
        .toList();

    if (args.whereType<ErrorTypeReport>().firstOrNull case final error?) {
      return error;
    }

    final returnType = ctx.returnType!.accept(this)!;

    if (returnType is ErrorTypeReport) {
      return returnType;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: Func(
        args: args.map((e) => e.typeOrNull).whereType<StellaType>().toList(),
        returnType: returnType.typeOrNull!,
      ),
    );
  }

  @override
  StellaTypeReport visitTypeForAll(TypeForAllContext ctx) {
    final typeReport = ctx.type_!.accept(this)!;

    if (typeReport is ErrorTypeReport) {
      return typeReport;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeForAll(
        types: ctx.types.map((t) => t.text).whereType<String>().toList(),
        type: typeReport.typeOrNull!,
      ),
    );
  }

  @override
  StellaTypeReport visitTypeRec(TypeRecContext ctx) {
    final typeReport = ctx.type_!.accept(this)!;

    if (typeReport is ErrorTypeReport) {
      return typeReport;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeRec(
        variable: ctx.var_!.text!,
        type: typeReport.typeOrNull!,
      ),
    );
  }

  @override
  StellaTypeReport visitTypeTuple(TypeTupleContext ctx) {
    final args = ctx.types
        .map((ctx) => ctx.accept(this))
        .whereType<StellaTypeReport>()
        .toList();

    if (args.whereType<ErrorTypeReport>().firstOrNull case final error?) {
      return error;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeTuple(
        types: args.map((c) => c.typeOrNull).whereType<StellaType>().toList(),
      ),
    );
  }

  @override
  StellaTypeReport visitTypeRecord(TypeRecordContext ctx) {
    final labels = ctx.fieldTypes.map((f) => f.label!.text!).toList();
    final types = ctx.fieldTypes.map((f) => f.type_!.accept(this)!).toList();

    if (labels.toSet().length != labels.length) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.duplicateRecordTypeFields,
      );
    }

    if (types.whereType<ErrorTypeReport>().firstOrNull case final error?) {
      return error;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeRecord(
        types: Map.fromIterables(
          labels,
          types.map((t) => t.typeOrNull).whereType<StellaType>().toList(),
        ),
      ),
    );
  }

  @override
  StellaTypeReport visitTypeVariant(TypeVariantContext ctx) {
    final labels = ctx.fieldTypes.map((f) => f.label!.text!).toList();
    final types = ctx.fieldTypes.map((f) => f.type_!.accept(this)!).toList();

    if (labels.toSet().length != labels.length) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.duplicateVariantTypeFields,
      );
    }

    if (types.whereType<ErrorTypeReport>().firstOrNull case final error?) {
      return error;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeVariant(
        types: Map.fromIterables(
          labels,
          types.map((t) => t.typeOrNull).whereType<StellaType>().toList(),
        ),
      ),
    );
  }

  @override
  StellaTypeReport visitTypeList(TypeListContext ctx) {
    final typeReport = ctx.type_!.accept(this)!;

    if (typeReport is ErrorTypeReport) {
      return typeReport;
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeList(
        type: typeReport.typeOrNull!,
      ),
    );
  }

  @override
  StellaTypeReport visitTypeUnit(TypeUnitContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Unit(),
    );
  }

  @override
  StellaTypeReport visitTypeTop(TypeTopContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Top(),
    );
  }

  @override
  StellaTypeReport visitTypeBottom(TypeBottomContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Bottom(),
    );
  }

  @override
  StellaTypeReport visitTypeAuto(TypeAutoContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Auto(),
    );
  }

  @override
  StellaTypeReport visitTypeVar(TypeVarContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeVar(ctx.name!.text!),
    );
  }

  /// T-False rule
  /// Always return [Bool]
  @override
  StellaTypeReport visitConstFalse(ConstFalseContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }

  /// T-True rule
  /// Always return [Bool]
  @override
  StellaTypeReport visitConstTrue(ConstTrueContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }

  /// T-If rule
  @override
  StellaTypeReport visitIf(IfContext ctx) {
    final conditionReport = ctx.condition!.accept(this)!;

    final thenReport = ctx.thenExpr!.accept(this)!;
    final elseReport = ctx.elseExpr!.accept(this)!;

    if (!conditionReport.hasType(const Bool())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          expected: const Bool(),
          actual: conditionReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Bool, but got ${conditionReport.typeOrNull}',
        cause: conditionReport,
        recoveryType: thenReport.typeOrNull ?? elseReport.typeOrNull,
      );
    }

    if (conditionReport is ErrorTypeReport) {
      return conditionReport.copyWith(
        typesContext: context.clone(),
        recoveryType: thenReport.typeOrNull ?? elseReport.typeOrNull,
      );
    }

    return thenReport.inferTypeReport(elseReport, context.clone());
  }

  /// T-Nat rule
  /// Always return [Nat]
  @override
  StellaTypeReport visitConstInt(ConstIntContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
    );
  }

  /// T-Succ rule
  /// Expect [Nat] at inner expression
  /// Return [Nat]
  @override
  StellaTypeReport visitSucc(SuccContext ctx) {
    final expReport = ctx.n!.accept(this)!;

    if (!expReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          expected: const Nat(),
          actual: expReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${expReport.typeOrNull}',
        cause: expReport,
        recoveryType: const Nat(),
      );
    }

    if (expReport is ErrorTypeReport) {
      return expReport.copyWith(
        typesContext: context.clone(),
        recoveryType: const Nat(),
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
    );
  }

  /// T-Pred rule
  /// Expect [Nat] at inner expression
  /// Return [Nat]
  @override
  StellaTypeReport visitPred(PredContext ctx) {
    final expReport = ctx.n!.accept(this)!;

    if (!expReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          expected: const Nat(),
          actual: expReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${expReport.typeOrNull}',
        cause: expReport,
        recoveryType: const Nat(),
      );
    }

    if (expReport is ErrorTypeReport) {
      return expReport.copyWith(
        typesContext: context.clone(),
        recoveryType: const Nat(),
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
    );
  }

  /// T-IsZero rule
  /// Expect [Nat] at inner expression
  /// Return [Bool]
  @override
  StellaTypeReport visitIsZero(IsZeroContext ctx) {
    final expReport = ctx.n!.accept(this)!;

    if (!expReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          expected: const Nat(),
          actual: expReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${expReport.typeOrNull}',
        cause: expReport,
        recoveryType: const Bool(),
      );
    }

    if (expReport is ErrorTypeReport) {
      return expReport.copyWith(
        typesContext: context.clone(),
        recoveryType: const Bool(),
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }

  /// T-NatRec rule
  /// Expect [Nat] at counter expression
  /// Expect [T] at init expression
  /// Expect [Func] of [Nat] -> ( [T] -> [T]) at counter expression
  /// Return [Bool]
  @override
  StellaTypeReport? visitNatRec(NatRecContext ctx) {
    final counterReport = ctx.n!.accept(this)!;
    final initReport = ctx.initial!.accept(this)!;
    final stepReport = ctx.step!.accept(this)!;

    if (!counterReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          expected: const Nat(),
          actual: counterReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${counterReport.typeOrNull}',
        cause: counterReport,
        recoveryType: initReport.typeOrNull,
      );
    }

    if (counterReport is ErrorTypeReport) {
      return counterReport.copyWith(
        typesContext: context.clone(),
        recoveryType: initReport.typeOrNull,
      );
    }

    return switch ((initReport, stepReport)) {
      (GotTypeReport(:final type), GotTypeReport()) =>
        stepReport.hasType(Nat() >> (type >> type))
            ? GotTypeReport(
                typesContext: context.clone(),
                type: type,
              )
            : ErrorTypeReport(
                typesContext: context.clone(),
                errorCode: StellaTypeError.unexpectedExpression(
                  expected: Nat() >> (type >> type),
                  actual: stepReport.tryAs<GotTypeReport>()?.type,
                ),
                message: 'Expected type Nat -> ($type -> $type), '
                    'but got ${stepReport.typeOrNull}',
                cause: initReport,
                recoveryType: initReport.typeOrNull,
              ),
      (GotTypeReport(:final type), ErrorTypeReport()) =>
        (stepReport as ErrorTypeReport).copyWith(
          typesContext: context.clone(),
          recoveryType: type,
        ),
      (ErrorTypeReport(), _) => (initReport as ErrorTypeReport).copyWith(
          typesContext: context.clone(),
          recoveryType: initReport.typeOrNull,
        ),
    };
  }

  /// T-Unit rule
  /// Always return [Unit]
  @override
  StellaTypeReport visitConstUnit(ConstUnitContext ctx) {
    return GotTypeReport(
      typesContext: context.clone(),
      type: const Unit(),
    );
  }

  /// T-Var rule
  /// Return var type if var in context, error otherwise
  @override
  StellaTypeReport visitVar(VarContext ctx) {
    final name = ctx.name!.text!;

    final type = context[name];

    if (type == null) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.undefinedVariable,
        message: 'Undefined variable $name',
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: type,
    );
  }

  /// T-Abs rule
  /// Inject args in context
  /// Checks return expression
  /// Return function
  @override
  StellaTypeReport? visitDeclFun(DeclFunContext ctx) {
    return withContext((context) {
      final name = ctx.name!.text!;
      final type = context[name] as Func;

      for (final (name, type) in ZipIterable(
        ctx.paramDecls.map((a) => a.name!.text!),
        type.args,
      )) {
        context[name] = type;
      }
      try {
        ctx.localDecls
            .map((decl) => decl.accept(TopLevelFunctionVisitor()))
            .fold(
              StellaTypesContext.root(),
              (ctx1, ctx2) => ctx1.merge(ctx2),
            )
            .let(context.add);
      } on ErrorTypeReport catch (error) {
        return error;
      }

      final innerErrorReport = ctx.localDecls
          .map((decl) => decl.accept(this))
          .whereType<ErrorTypeReport>()
          .firstOrNull;

      if (innerErrorReport != null) {
        return innerErrorReport;
      }

      final retExp = ctx.returnExpr!.accept(this)!;

      if (!retExp.hasType(type.returnType)) {
        return ErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedExpression(
            expected: type.returnType,
            actual: retExp.tryAs<GotTypeReport>()?.type,
          ),
          message: 'Expected type ${type.returnType}, '
              'but got ${retExp.typeOrNull}',
          cause: retExp,
          recoveryType: type,
        );
      }

      if (retExp is ErrorTypeReport) {
        return retExp.copyWith(
          typesContext: context.clone(),
          recoveryType: Func(
            args: type.args,
            returnType: type.returnType,
          ),
        );
      }

      return GotTypeReport(
        typesContext: context.clone(),
        type: Func(
          args: type.args,
          returnType: type.returnType,
        ),
      );
    });
  }

  /// T-Abs rule
  /// Inject args in context
  /// Checks return expression
  /// Return function
  @override
  StellaTypeReport? visitAbstraction(AbstractionContext ctx) {
    return withContext((context) {
      var paramDecls = ctx.paramDecls;

      final argNames = paramDecls.map(
        (decl) => decl.name!.text!,
      );
      final argTypes = paramDecls.map(
        (decl) => decl.paramType!.accept(this)!,
      );

      if (argTypes.whereType<ErrorTypeReport>().firstOrNull case final error?) {
        return error;
      }

      for (final (name, type) in ZipIterable(argNames, argTypes)) {
        context[name] = type.typeOrNull!;
      }

      final retExp = ctx.returnExpr!.accept(this)!;

      return switch (retExp) {
        GotTypeReport(:final type) => type.isStrict
            ? GotTypeReport(
                typesContext: context.clone(),
                type: Func(
                  args: argTypes
                      .map((t) => t.typeOrNull)
                      .whereType<StellaType>()
                      .toList(),
                  returnType: type,
                  lambda: true,
                ),
              )
            : ErrorTypeReport(
                typesContext: context.clone(),
                errorCode: StellaTypeError.ambiguousType(type),
                message: 'Ambiguous type',
                cause: retExp,
              ),
        ErrorTypeReport(:final typeOrNull) => typeOrNull?.let(
              (it) => retExp.copyWith(
                  typesContext: context.clone(),
                  recoveryType: it.isStrict
                      ? Func(
                          args: argTypes
                              .map((t) => t.typeOrNull)
                              .whereType<StellaType>()
                              .toList(),
                          returnType: it,
                          lambda: true,
                        )
                      : null,
                ),
            ) ??
            retExp,
      };
    });
  }

  /// T-App rule
  /// Check type of function and args
  /// Return the function type
  @override
  StellaTypeReport? visitApplication(ApplicationContext ctx) {
    final funcReport = ctx.fun?.accept(this);

    if (funcReport is! GotTypeReport) {
      return funcReport;
    }

    final type = funcReport.type;
    if (type is! Func) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notAFunction,
        message: 'Can`t apply arguments, to not a function type',
      );
    }

    if (type.args.length != ctx.args.length) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.incorrectNumberOfArguments,
        message: 'Expect ${type.args.length} args, but got ${ctx.args.length}',
        recoveryType: type.returnType,
      );
    }

    for (final (expected, actual) in ZipIterable(type.args, ctx.args)) {
      final actualTypeReport = actual.accept(this)!;

      if (!actualTypeReport.hasType(expected)) {
        return ErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedExpression(
            expected: expected,
            actual: actualTypeReport.typeOrNull,
          ),
          message: 'Expected type $expected, '
              'but got ${actualTypeReport.typeOrNull}',
          cause: actualTypeReport,
          recoveryType: type.returnType,
        );
      }
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: type.returnType,
    );
  }

  /// T-Unit rule
  /// Check type of first and second expression
  /// Return the type of second expr
  @override
  StellaTypeReport? visitSequence(SequenceContext ctx) {
    final exprReport1 = ctx.expr1!.accept(this)!;
    final exprReport2 = ctx.expr2!.accept(this)!;

    if (!exprReport1.hasType(const Unit())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          expected: const Unit(),
          actual: exprReport1.typeOrNull,
        ),
        message: 'Expected type Unit, but got ${exprReport1.typeOrNull}',
        cause: exprReport1,
        recoveryType: exprReport2.typeOrNull,
      );
    }

    if (exprReport1 is ErrorTypeReport) {
      return exprReport1.copyWith(
        typesContext: context.clone(),
        recoveryType: exprReport2.typeOrNull,
      );
    }

    return exprReport2;
  }

  /// T-Tuple rule
  /// return Tuple type
  @override
  StellaTypeReport visitTuple(TupleContext ctx) {
    final components = ctx.exprs.map((c) => c.accept(this)!).toList();
    final type = components.map((component) => component.typeOrNull).toList();

    final anyErrorReport = components.whereType<ErrorTypeReport>().firstOrNull;

    if (anyErrorReport != null) {
      return anyErrorReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeTuple(
          types: type,
        ),
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeTuple(types: type),
    );
  }

  /// T-Proj rule
  /// return Type of proj
  @override
  StellaTypeReport visitDotTuple(DotTupleContext ctx) {
    final tupleReport = ctx.expr_!.accept(this)!;
    final index = int.parse(ctx.index!.text!) - 1;

    final tupleType = tupleReport.typeOrNull;

    if (tupleType is! TypeTuple?) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notATuple,
        message: 'Expected type Tuple, but got $tupleType',
        cause: tupleReport,
      );
    }

    final tupleLen = tupleType?.types.length ?? 0;
    if (tupleLen <= index || index < 0) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.tupleIndexOutOfBounds,
        message: 'Index out of bounds. Expected 1 <= index <= ${tupleLen + 1},'
            ' but got ${index + 1}',
        cause: tupleReport,
      );
    }

    if (tupleReport is ErrorTypeReport) {
      return tupleReport.copyWith(
        typesContext: context.clone(),
        recoveryType: tupleType?.types[index],
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: tupleType!.types[index]!,
    );
  }

  /// T-Record rule
  /// return Record type
  @override
  StellaTypeReport visitRecord(RecordContext ctx) {
    final names = ctx.binds.map((c) => c.name!.text!).toList();
    final types = ctx.binds.map((c) => c.rhs!.accept(this)!).toList();
    final recordTypes = ZipIterable(names, types).map(
      (entry) => MapEntry(
        entry.$1,
        entry.$2.typeOrNull,
      ),
    );

    final namesSet = names.toSet();
    if (namesSet.length != names.length) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.duplicateRecordFields,
        message: 'Duplicate record fields detected',
        recoveryType: TypeRecord(
          types: Map.fromEntries(recordTypes),
        ),
      );
    }

    final anyErrorReport = types.whereType<ErrorTypeReport>().firstOrNull;
    if (anyErrorReport != null) {
      return anyErrorReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeRecord(
          types: Map.fromEntries(recordTypes),
        ),
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeRecord(
        types: Map.fromEntries(recordTypes),
      ),
    );
  }

  /// T-Proj rule
  /// return Type of proj
  @override
  StellaTypeReport visitDotRecord(DotRecordContext ctx) {
    final recordReport = ctx.expr_!.accept(this)!;
    final label = ctx.label!.text!;

    final recordType = recordReport.typeOrNull;

    if (recordType is! TypeRecord?) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notARecord,
        message: 'Expected type Record, but got $recordType',
        cause: recordReport,
      );
    }

    if (recordReport is ErrorTypeReport) {
      return recordReport.copyWith(
        typesContext: context.clone(),
        recoveryType: recordType?.types[label],
      );
    }

    if (!recordType!.types.containsKey(label)) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedFieldAccess,
        message: 'Missing field: $label in record $recordType',
        cause: recordReport,
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: recordType.types[label]!,
    );
  }

  /// T-Inl
  @override
  StellaTypeReport? visitInl(InlContext ctx) {
    final typeReport = ctx.expr_!.accept(this)!;

    if (typeReport is ErrorTypeReport) {
      return typeReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeSum(
          left: typeReport.typeOrNull,
        ),
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeSum(
        left: typeReport.typeOrNull,
      ),
    );
  }

  /// T-Inr
  @override
  StellaTypeReport? visitInr(InrContext ctx) {
    final typeReport = ctx.expr_!.accept(this)!;

    if (typeReport is ErrorTypeReport) {
      return typeReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeSum(
          right: typeReport.typeOrNull,
        ),
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: TypeSum(
        right: typeReport.typeOrNull,
      ),
    );
  }
}
