import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:satchel/src/type_checker/model/constraints.dart';
import 'package:satchel/src/type_checker/model/stella_patterns.dart';
import 'package:satchel/src/type_checker/types/type_system.dart';
import 'package:satchel/src/type_checker/visitor/stella_pattern_visitor.dart';
import 'package:satchel/src/util/extensions.dart';
import 'package:satchel/src/util/iterable.dart';

import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_type_report.dart';
import '../model/stella_types.dart';
import '../model/stella_types_context.dart';
import '../types/variable_generator.dart';

typedef ContextConstraintBuilder =
    ConstraintStellaTypeReport? Function(IStellaTypesContextBuilder);

class StellaReconstructionTypeVisitor
    extends StellaParserBaseVisitor<ConstraintStellaTypeReport> {
  VariableGenerator get variableGenerator => context.variableGenerator;
  IStellaTypesContext context;

  StellaReconstructionTypeVisitor([this.context = const StellaTypesContext()]);

  @override
  ConstraintStellaTypeReport? aggregateResult(
    ConstraintStellaTypeReport? aggregate,
    ConstraintStellaTypeReport? nextResult,
  ) {
    if (nextResult is ErrorTypeReport) {
      return nextResult;
    }

    return aggregate?.copyWith(constrains: nextResult?.constrains) ??
        nextResult;
  }

  ConstraintStellaTypeReport? withContext(ContextConstraintBuilder builder) {
    final originalContext = context;

    final copyContext = context = originalContext.clone();
    final res = builder(copyContext);
    context = originalContext;

    return res;
  }

  @override
  ConstraintStellaTypeReport visitTypeBool(TypeBoolContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeNat(TypeNatContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeSum(TypeSumContext ctx) {
    final left = ctx.left!.accept(this)!;
    final right = ctx.right!.accept(this)!;

    if (left is ErrorTypeReport) {
      return left;
    }

    if (right is ErrorTypeReport) {
      return right;
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeSum(left: left.typeOrNull!, right: right.typeOrNull!),
      constrains: left.constrains.followedBy(right.constrains),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeFun(TypeFunContext ctx) {
    final args = ctx.paramTypes
        .map((ctx) => ctx.accept(this))
        .whereType<ConstraintStellaTypeReport>()
        .toList();

    if (args.whereType<ConstraintErrorTypeReport>().firstOrNull
        case final error?) {
      return error;
    }

    final returnType = ctx.returnType!.accept(this)!;

    if (returnType is ErrorTypeReport) {
      return returnType;
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: Func(
        args: args.map((e) => e.typeOrNull).whereType<StellaType>().toList(),
        returnType: returnType.typeOrNull!,
      ),
      constrains: args
          .expand((a) => a.constrains)
          .followedBy(returnType.constrains),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeTuple(TypeTupleContext ctx) {
    final args = ctx.types
        .map((ctx) => ctx.accept(this))
        .whereType<ConstraintStellaTypeReport>()
        .toList();

    var errorTypeReport = args
        .whereType<ConstraintErrorTypeReport>()
        .firstOrNull;
    if (errorTypeReport case final error?) {
      return error;
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeTuple(
        types: args.map((c) => c.typeOrNull).whereType<StellaType>().toList(),
      ),
      constrains: args.expand((a) => a.constrains),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeRecord(TypeRecordContext ctx) {
    final labels = ctx.fieldTypes.map((f) => f.label!.text!).toList();
    final types = ctx.fieldTypes.map((f) => f.type_!.accept(this)!).toList();

    if (labels.toSet().length != labels.length) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.duplicateRecordTypeFields,
        constrains: types.expand((a) => a.constrains),
      );
    }

    final errorTypeReport = types
        .whereType<ConstraintErrorTypeReport>()
        .firstOrNull;
    if (errorTypeReport case final error?) {
      return error;
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeRecord(
        types: LinkedHashMap.fromIterables(
          labels,
          types.map((t) => t.typeOrNull).whereType<StellaType>().toList(),
        ),
      ),
      constrains: types.expand((a) => a.constrains),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeVariant(TypeVariantContext ctx) {
    final labels = ctx.fieldTypes.map((f) => f.label!.text!).toList();
    final types = ctx.fieldTypes.map((f) => f.type_?.accept(this)).toList();

    if (labels.toSet().length != labels.length) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.duplicateVariantTypeFields,
        constrains: types.whereType<ConstraintStellaTypeReport>().expand(
          (a) => a.constrains,
        ),
      );
    }

    final typeReport = types.whereType<ConstraintErrorTypeReport>().firstOrNull;
    if (typeReport case final error?) {
      return error;
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeVariant(
        types: LinkedHashMap.fromIterables(
          labels,
          types.map((t) => t?.typeOrNull).toList(),
        ),
      ),
      constrains: types.whereType<ConstraintStellaTypeReport>().expand(
        (a) => a.constrains,
      ),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeList(TypeListContext ctx) {
    final typeReport = ctx.type_!.accept(this)!;

    if (typeReport is ErrorTypeReport) {
      return typeReport;
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeList(type: typeReport.typeOrNull!),
      constrains: typeReport.constrains,
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeUnit(TypeUnitContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Unit(),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeTop(TypeTopContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Top(),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeBottom(TypeBottomContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Bottom(),
    );
  }

  @override
  ConstraintStellaTypeReport visitTypeAuto(TypeAutoContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: variableGenerator.nextVariable(),
    );
  }

  /// T-False rule
  /// Always return [Bool]
  @override
  ConstraintStellaTypeReport visitConstFalse(ConstFalseContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }

  /// T-True rule
  /// Always return [Bool]
  @override
  ConstraintStellaTypeReport visitConstTrue(ConstTrueContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }

  /// CT-If rule
  @override
  ConstraintStellaTypeReport visitIf(IfContext ctx) {
    final conditionReport = ctx.condition!.accept(this)!;

    final thenReport = ctx.thenExpr!.accept(this)!;
    final elseReport = ctx.elseExpr!.accept(this)!;

    final constrains = conditionReport.constrains
        .followedBy(thenReport.constrains)
        .followedBy(elseReport.constrains)
        .followedBy(
          [
            _makeConstraint(conditionReport.typeOrNull, const Bool()),
            _makeConstraint(thenReport.typeOrNull, elseReport.typeOrNull),
          ].whereType<Constraints>(),
        );

    if (!conditionReport.hasType(const Bool())) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: const Bool(),
          actual: conditionReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Bool, but got ${conditionReport.typeOrNull}',
        cause: conditionReport,
        recoveryType: thenReport.typeOrNull ?? elseReport.typeOrNull,
        constrains: constrains,
      );
    }

    if (conditionReport is ConstraintErrorTypeReport) {
      return conditionReport.copyWith(
        typesContext: context.clone(),
        recoveryType: thenReport.typeOrNull ?? elseReport.typeOrNull,
        constrains: constrains,
      );
    }

    return thenReport
        .inferTypeReport(elseReport, context.clone())
        .copyWith(constrains: constrains);
  }

  /// T-Nat rule
  /// Always return [Nat]
  @override
  ConstraintStellaTypeReport visitConstInt(ConstIntContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
    );
  }

  /// T-Succ rule
  /// Expect [Nat] at inner expression
  /// Return [Nat]
  @override
  ConstraintStellaTypeReport visitSucc(SuccContext ctx) {
    final expReport = ctx.n!.accept(this)!;

    final constrains = expReport.constrains.followedBy(
      [
        _makeConstraint(expReport.typeOrNull, const Nat()),
      ].whereType<Constraints>(),
    );

    if (!expReport.hasType(const Nat())) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: const Nat(),
          actual: expReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${expReport.typeOrNull}',
        cause: expReport,
        recoveryType: const Nat(),
        constrains: constrains,
      );
    }

    if (expReport is ConstraintErrorTypeReport) {
      return expReport.copyWith(
        typesContext: context.clone(),
        recoveryType: const Nat(),
        constrains: constrains,
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
      constrains: constrains,
    );
  }

  /// T-Pred rule
  /// Expect [Nat] at inner expression
  /// Return [Nat]
  @override
  ConstraintStellaTypeReport visitPred(PredContext ctx) {
    final expReport = ctx.n!.accept(this)!;

    final constrains = expReport.constrains.followedBy(
      [
        _makeConstraint(expReport.typeOrNull, const Nat()),
      ].whereType<Constraints>(),
    );

    if (!expReport.hasType(const Nat())) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: const Nat(),
          actual: expReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${expReport.typeOrNull}',
        cause: expReport,
        recoveryType: const Nat(),
        constrains: constrains,
      );
    }

    if (expReport is ConstraintErrorTypeReport) {
      return expReport.copyWith(
        typesContext: context.clone(),
        recoveryType: const Nat(),
        constrains: constrains,
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Nat(),
      constrains: constrains,
    );
  }

  /// T-IsZero rule
  /// Expect [Nat] at inner expression
  /// Return [Bool]
  @override
  ConstraintStellaTypeReport visitIsZero(IsZeroContext ctx) {
    final expReport = ctx.n!.accept(this)!;

    final constrains = expReport.constrains.followedBy(
      [
        _makeConstraint(expReport.typeOrNull, const Nat()),
      ].whereType<Constraints>(),
    );

    if (!expReport.hasType(const Nat())) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: const Nat(),
          actual: expReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${expReport.typeOrNull}',
        cause: expReport,
        recoveryType: const Bool(),
        constrains: constrains,
      );
    }

    if (expReport is ConstraintErrorTypeReport) {
      return expReport.copyWith(
        typesContext: context.clone(),
        recoveryType: const Bool(),
        constrains: constrains,
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
      constrains: constrains,
    );
  }

  /// T-NatRec rule
  /// Expect [Nat] at counter expression
  /// Expect [T] at init expression
  /// Expect [Func] of [Nat] -> ( [T] -> [T]) at counter expression
  /// Return [Bool]
  @override
  ConstraintStellaTypeReport? visitNatRec(NatRecContext ctx) {
    final counterReport = ctx.n!.accept(this)!;
    final initReport = ctx.initial!.accept(this)!;
    final stepReport = ctx.step!.accept(this)!;

    final constrains = counterReport.constrains
        .followedBy(initReport.constrains)
        .followedBy(stepReport.constrains)
        .followedBy(
          [
            _makeConstraint(counterReport.typeOrNull, const Nat()),
          ].whereType<Constraints>(),
        );

    if (!counterReport.hasType(const Nat())) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: const Nat(),
          actual: counterReport.tryAs<GotTypeReport>()?.type,
        ),
        message: 'Expected type Nat, but got ${counterReport.typeOrNull}',
        cause: counterReport,
        recoveryType: initReport.typeOrNull,
        constrains: constrains,
      );
    }

    if (counterReport is ConstraintErrorTypeReport) {
      return counterReport.copyWith(
        typesContext: context.clone(),
        recoveryType: initReport.typeOrNull,
        constrains: constrains,
      );
    }

    return switch ((initReport, stepReport)) {
      (ConstraintGotTypeReport(:final type), ConstraintGotTypeReport()) =>
        stepReport.hasType(Nat() >> (type >> type))
            ? ConstraintGotTypeReport(
                typesContext: context.clone(),
                type: type,
                constrains: constrains.followedBy(
                  [
                    _makeConstraint(
                      stepReport.typeOrNull,
                      Nat() >> (type >> type),
                    ),
                  ].whereType<Constraints>(),
                ),
              )
            : ConstraintErrorTypeReport(
                typesContext: context.clone(),
                errorCode: StellaTypeError.unexpectedExpression(
                  context: context,
                  expected: Nat() >> (type >> type),
                  actual: stepReport.tryAs<GotTypeReport>()?.type,
                ),
                message:
                    'Expected type Nat -> ($type -> $type), '
                    'but got ${stepReport.typeOrNull}',
                cause: initReport,
                recoveryType: initReport.typeOrNull,
                constrains: constrains,
              ),
      (ConstraintGotTypeReport(:final type), ConstraintErrorTypeReport()) =>
        (stepReport as ConstraintErrorTypeReport).copyWith(
          typesContext: context.clone(),
          recoveryType: type,
        ),
      (ConstraintErrorTypeReport(), _) =>
        (initReport as ConstraintErrorTypeReport).copyWith(
          typesContext: context.clone(),
          recoveryType: initReport.typeOrNull,
        ),
      (_, _) => throw Error(),
    };
  }

  /// T-Unit rule
  /// Always return [Unit]
  @override
  ConstraintStellaTypeReport visitConstUnit(ConstUnitContext ctx) {
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Unit(),
    );
  }

  /// T-Var rule
  /// Return var type if var in context, error otherwise
  @override
  ConstraintStellaTypeReport visitVar(VarContext ctx) {
    final name = ctx.name!.text!;

    final type = context[name];

    if (type == null) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.undefinedVariable,
        message: 'Undefined variable $name',
        constrains: [],
      );
    }

    return ConstraintGotTypeReport(typesContext: context.clone(), type: type);
  }

  /// T-Abs rule
  /// Inject args in context
  /// Checks return expression
  /// Return function
  @override
  ConstraintStellaTypeReport? visitDeclFun(DeclFunContext ctx) {
    return withContext((context) {
      final name = ctx.name!.text!;
      final type = context[name] as Func;

      for (final (name, type) in ZipIterable(
        ctx.paramDecls.map((a) => a.name!.text!),
        type.args,
      )) {
        context[name] = type;
      }

      // TODO: nested func
      /* try {
        ctx.localDecls
            .map((decl) => decl.accept(TopLevelContextVisitor()))
            .fold(StellaTypesContext.root(), (ctx1, ctx2) => ctx1.merge(ctx2))
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
      */

      final retExp = ctx.returnExpr!.accept(this)!;

      if (!retExp.hasType(type.returnType)) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedExpression(
            context: context,
            expected: type.returnType,
            actual: retExp.tryAs<GotTypeReport>()?.type,
          ),
          message:
              'Expected type ${type.returnType}, '
              'but got ${retExp.typeOrNull}',
          cause: retExp,
          recoveryType: type,
          constrains: retExp.constrains,
        );
      }

      if (retExp is ConstraintErrorTypeReport) {
        return retExp.copyWith(
          typesContext: context.clone(),
          recoveryType: Func(args: type.args, returnType: type.returnType),
        );
      }

      return ConstraintGotTypeReport(
        typesContext: context.clone(),
        type: Func(args: type.args, returnType: type.returnType),
        constrains: retExp.constrains,
      );
    });
  }

  /// T-Abs rule
  /// Inject args in context
  /// Checks return expression
  /// Return function
  @override
  ConstraintStellaTypeReport? visitAbstraction(AbstractionContext ctx) {
    return withContext((context) {
      var paramDecls = ctx.paramDecls;

      final argNames = paramDecls.map((decl) => decl.name!.text!);
      final argTypes = paramDecls.map((decl) => decl.paramType!.accept(this)!);

      final errorReport = argTypes
          .whereType<ConstraintGotTypeReport>()
          .firstOrNull;

      if (errorReport case final error?) {
        return error;
      }

      for (final (name, type) in ZipIterable(argNames, argTypes)) {
        context[name] = type.typeOrNull!;
      }

      final retExp = ctx.returnExpr!.accept(this)!;

      final constraints = argTypes
          .expand((a) => a.constrains)
          .followedBy(retExp.constrains);

      switch (retExp) {
        case ConstraintGotTypeReport(:var type):
          final ts = TypeSystem.of(context);
          type = ts.resolveAmbiguousType(type)!;

          ConstraintStellaTypeReport gotReport = type.isStrict
              ? ConstraintGotTypeReport(
                  typesContext: context.clone(),
                  type: Func(
                    args: argTypes
                        .map((t) => t.typeOrNull)
                        .whereType<StellaType>()
                        .toList(),
                    returnType: type,
                    lambda: true,
                  ),
                  constrains: constraints,
                )
              : ConstraintErrorTypeReport(
                  typesContext: context.clone(),
                  errorCode: StellaTypeError.ambiguousType(type),
                  message: 'Ambiguous type',
                  cause: retExp,
                  constrains: constraints,
                );

          return gotReport;
        case ConstraintErrorTypeReport(:final typeOrNull):
          return typeOrNull?.let(
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
                  constrains: constraints,
                ),
              ) ??
              retExp;
        default:
          throw Error();
      }
    });
  }

  /// T-App rule
  /// Check type of function and args
  /// Return the function type
  @override
  ConstraintStellaTypeReport? visitApplication(ApplicationContext ctx) {
    final funcReport = ctx.fun?.accept(this);

    if (funcReport is! ConstraintGotTypeReport) {
      return funcReport;
    }

    final type = funcReport.type;
    if (type is! Func && type is! TypeVar) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notAFunction,
        message: 'Can`t apply arguments, to not a function type',
        constrains: [],
      );
    }

    if (type is Func && type.args.length != ctx.args.length) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.incorrectNumberOfArguments,
        message: 'Expect ${type.args.length} args, but got ${ctx.args.length}',
        recoveryType: type.returnType,
        constrains: [],
      );
    }

    Iterable<Constraints> constrains = [];
    List<StellaType> argTypes = [];
    if (type is Func) {
      for (final (expected, actual) in ZipIterable(type.args, ctx.args)) {
        final actualTypeReport = actual.accept(this)!;
        constrains = constrains.followedBy(actualTypeReport.constrains);

        if (!actualTypeReport.hasType(expected)) {
          return ConstraintErrorTypeReport(
            typesContext: context.clone(),
            errorCode: StellaTypeError.unexpectedExpression(
              context: context,
              expected: expected,
              actual: actualTypeReport.typeOrNull,
            ),
            message:
                'Expected type $expected, '
                'but got ${actualTypeReport.typeOrNull}',
            cause: actualTypeReport,
            recoveryType: type.returnType,
            constrains: [],
          );
        }

        if (actualTypeReport is ConstraintErrorTypeReport) {
          return actualTypeReport.copyWith(
            typesContext: context.clone(),
            recoveryType: type.returnType,
          );
        }

        argTypes.add(actualTypeReport.typeOrNull!);
      }
    } else {
      final reports = ctx.args.map((a) => a.accept(this)!).toList();

      if (reports.whereType<ConstraintErrorTypeReport>().firstOrNull
          case final error?) {
        return error;
      }

      constrains = reports.expand((a) => a.constrains);
      argTypes = reports.map((a) => a.typeOrNull!).toList();
    }

    final varRet = variableGenerator.nextVariable();

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: varRet,
      constrains: constrains
          .followedBy(funcReport.constrains)
          .followedBy(
            [
              _makeConstraint(type, Func(args: argTypes, returnType: varRet)),
            ].whereType<Constraints>(),
          ),
    );
  }

  /// T-Tuple rule
  /// return Tuple type
  @override
  ConstraintStellaTypeReport visitTuple(TupleContext ctx) {
    final components = ctx.exprs.map((c) => c.accept(this)!).toList();
    final type = components.map((component) => component.typeOrNull).toList();

    final anyErrorReport = components
        .whereType<ConstraintErrorTypeReport>()
        .firstOrNull;

    final constrains = components.expand((e) => e.constrains);

    if (anyErrorReport != null) {
      return anyErrorReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeTuple(types: type),
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeTuple(types: type),
      constrains: constrains,
    );
  }

  /// T-Proj rule
  /// return Type of proj
  @override
  ConstraintStellaTypeReport visitDotTuple(DotTupleContext ctx) {
    final tupleReport = ctx.expr_!.accept(this)!;
    final index = int.parse(ctx.index!.text!) - 1;

    StellaType? tupleType = tupleReport.typeOrNull;
    final ts = TypeSystem.of(context);
    tupleType = ts.resolveAmbiguousType(tupleType);

    if (tupleType is! TypeTuple? && tupleType is! TypeVar) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notATuple,
        message: 'Expected type Tuple, but got $tupleType',
        cause: tupleReport,
        constrains: [],
      );
    }

    if (tupleType != null && !tupleType.isStrict) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.ambiguousType(tupleType),
        message: 'Ambiguous type',
        cause: tupleReport,
        constrains: [],
      );
    }

    // TODO: FREE VARS
    if (tupleType is TypeTuple?) {
      final tupleLen = tupleType?.types.length ?? 0;
      final closed = tupleType?.closed ?? true;
      if (!closed && (tupleLen <= index || index < 0)) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.tupleIndexOutOfBounds,
          message:
              'Index out of bounds. Expected 1 <= index <= ${tupleLen + 1},'
              ' but got ${index + 1}',
          cause: tupleReport,
          constrains: [],
        );
      }
    }

    if (tupleReport is ErrorTypeReport) {
      return tupleReport;
    }

    final typeVar = variableGenerator.nextVariable();

    final type = tupleType.tryAs<TypeTuple>()?.types[index];
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: type ?? typeVar,
      constrains: tupleReport.constrains.followedBy(
        [
          if (type == null)
            _makeConstraint(
              tupleType,
              TypeTuple(
                types: [
                  if (index > 0)
                    ...Iterable.generate(
                      index - 1,
                      (_) => variableGenerator.nextVariable(),
                    ),
                  typeVar,
                ],
                closed: false,
              ),
            ),
        ].whereType<Constraints>(),
      ),
    );
  }

  /// T-Record rule
  /// return Record type
  @override
  ConstraintStellaTypeReport visitRecord(RecordContext ctx) {
    final names = ctx.binds.map((c) => c.name!.text!).toList();
    final types = ctx.binds.map((c) => c.rhs!.accept(this)!).toList();
    final recordTypes = ZipIterable(
      names,
      types,
    ).map((entry) => MapEntry(entry.$1, entry.$2.typeOrNull));

    final namesSet = names.toSet();
    if (namesSet.length != names.length) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.duplicateRecordFields,
        message: 'Duplicate record fields detected',
        recoveryType: TypeRecord(
          types: LinkedHashMap.fromEntries(recordTypes),
          instance: true,
        ),
        constrains: [],
      );
    }

    final anyErrorReport = types
        .whereType<ConstraintErrorTypeReport>()
        .firstOrNull;
    if (anyErrorReport != null) {
      return anyErrorReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeRecord(
          types: LinkedHashMap.fromEntries(recordTypes),
          instance: true,
        ),
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeRecord(
        types: LinkedHashMap.fromEntries(recordTypes),
        instance: true,
      ),
      constrains: types.expand((t) => t.constrains),
    );
  }

  /// T-Proj rule
  /// return Type of proj
  @override
  ConstraintStellaTypeReport visitDotRecord(DotRecordContext ctx) {
    final recordReport = ctx.expr_!.accept(this)!;
    final label = ctx.label!.text!;

    final recordType = recordReport.typeOrNull;

    if (recordType is! TypeRecord? && recordType is! TypeVar?) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notARecord,
        message: 'Expected type Record, but got $recordType',
        cause: recordReport,
        constrains: [],
      );
    }

    if (recordReport is ConstraintErrorTypeReport) {
      return recordReport.copyWith(
        typesContext: context.clone(),
        recoveryType: recordType?.tryAs<TypeRecord>()?.types[label],
      );
    }

    if (recordType is TypeRecord? &&
        recordType != null &&
        !recordType.isStrict) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.ambiguousType(recordType),
        message: 'Ambiguous type',
        cause: recordReport,
        constrains: [],
      );
    }

    if (recordType is TypeRecord && !recordType.types.containsKey(label)) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedFieldAccess,
        message: 'Missing field: $label in record $recordType',
        cause: recordReport,
        constrains: [],
      );
    }

    final typeVar = variableGenerator.nextVariable();

    final type = recordType?.tryAs<TypeRecord>()?.types[label];
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: type ?? typeVar,
      constrains: recordReport.constrains.followedBy(
        [
          if (type == null)
            _makeConstraint(
              recordType,
              TypeRecord(types: LinkedHashMap.from({label: typeVar})),
            ),
        ].whereType<Constraints>(),
      ),
    );
  }

  /// T-Inl
  @override
  ConstraintStellaTypeReport visitInl(InlContext ctx) {
    final typeReport = ctx.expr_!.accept(this)!;

    if (typeReport is ConstraintErrorTypeReport) {
      return typeReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeSum(left: typeReport.typeOrNull),
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeSum(
        left: typeReport.typeOrNull,
        right: variableGenerator.nextVariable(),
      ),
      constrains: typeReport.constrains,
    );
  }

  /// T-Inr
  @override
  ConstraintStellaTypeReport visitInr(InrContext ctx) {
    final typeReport = ctx.expr_!.accept(this)!;

    if (typeReport is ConstraintErrorTypeReport) {
      return typeReport.copyWith(
        typesContext: context.clone(),
        recoveryType: TypeSum(right: typeReport.typeOrNull),
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeSum(
        left: variableGenerator.nextVariable(),
        right: typeReport.typeOrNull,
      ),
      constrains: typeReport.constrains,
    );
  }

  /// T-Variant
  @override
  ConstraintStellaTypeReport visitVariant(VariantContext ctx) {
    final label = ctx.label!.text!;
    final expression = ctx.rhs?.accept(this);

    if (expression is ConstraintErrorTypeReport) {
      return expression.copyWith(
        typesContext: context.clone(),
        recoveryType: expression.let(
          (it) => TypeVariant(
            types: LinkedHashMap.fromIterables([label], [it.typeOrNull]),
            strict: false,
          ),
        ),
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeVariant(
        types: LinkedHashMap.fromIterables([label], [expression?.typeOrNull]),
        strict: false,
      ),
      constrains: expression?.constrains ?? [],
    );
  }

  /// T-Fix
  @override
  ConstraintStellaTypeReport? visitFix(FixContext ctx) {
    final funcReport = ctx.expr_?.accept(this);

    if (funcReport is ConstraintErrorTypeReport) {
      return funcReport;
    }

    final type = funcReport!.typeOrNull!;
    if (type is! Func && type is! TypeVar) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notAFunction,
        message: 'Can`t apply fix, to not a function type',
        constrains: [],
      );
    }

    if (type is Func && type.args.length != 1) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.incorrectNumberOfArguments,
        message: 'Expect 1 args, but got ${type.args.length}',
        constrains: [],
      );
    }

    StellaType expectedType;
    if (type is Func) {
      expectedType = type.args.single;

      if (!funcReport.hasType(expectedType >> expectedType)) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedExpression(
            context: context,
            expected: expectedType >> expectedType,
            actual: type,
          ),
          message: 'Can`t apply fix, to bad function type',
          constrains: [],
        );
      }
    } else {
      expectedType = variableGenerator.nextVariable();
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: expectedType,
      constrains: funcReport.constrains.followedBy(
        [
          if (funcReport.typeOrNull is! Func)
            _makeConstraint(
              funcReport.typeOrNull,
              expectedType >> expectedType,
            ),
        ].whereType<Constraints>(),
      ),
    );
  }

  @override
  ConstraintStellaTypeReport? visitList(ListContext ctx) {
    final exprReport = ctx.exprs
        .map((exp) => exp.accept(this))
        .whereType<ConstraintStellaTypeReport>()
        .toList();

    if (exprReport.whereType<ConstraintErrorTypeReport>().firstOrNull
        case final error?) {
      return error.copyWith(typesContext: context, recoveryType: TypeList());
    }

    final typeSet = exprReport
        .map((e) => e.typeOrNull)
        .where((t) => t is! TypeVar)
        .toSet();

    if (typeSet.length > 1) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: typeSet.first!,
          actual: typeSet.last,
        ),
        message: 'Ambiguous type',
        constrains: [],
      );
    }

    final type = typeSet.singleOrNull ?? variableGenerator.nextVariable();

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeList(type: type),
      constrains: exprReport
          .expand((t) => t.constrains)
          .followedBy(
            [
              for (final t in typeSet) _makeConstraint(type, t),
            ].whereType<Constraints>(),
          ),
    );
  }

  @override
  ConstraintStellaTypeReport? visitConsList(ConsListContext ctx) {
    final headReport = ctx.head!.accept(this)!;
    final tailReport = ctx.tail!.accept(this)!;

    if (headReport is ConstraintErrorTypeReport) {
      return headReport.copyWith(
        typesContext: context,
        recoveryType: TypeList(type: headReport.typeOrNull),
      );
    }

    if (tailReport is ConstraintErrorTypeReport) {
      return tailReport.copyWith(
        typesContext: context,
        recoveryType: TypeList(type: headReport.typeOrNull),
      );
    }

    if (!tailReport.hasType(TypeList(type: headReport.typeOrNull))) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: TypeList(type: headReport.typeOrNull),
          actual: tailReport.typeOrNull,
        ),
        message: 'Ambiguous type of list',
        constrains: [],
      );
    }

    final typeOfList = headReport.typeOrNull;
    final type = typeOfList ?? variableGenerator.nextVariable();

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeList(type: type),
      constrains: headReport.constrains
          .followedBy(tailReport.constrains)
          .followedBy(
            [
              _makeConstraint(tailReport.typeOrNull, TypeList(type: type)),
            ].whereType<Constraints>(),
          ),
    );
  }

  @override
  ConstraintStellaTypeReport? visitHead(HeadContext ctx) {
    final listReport = ctx.list!.accept(this)!;

    StellaType? listType = listReport.typeOrNull;
    final ts = TypeSystem.of(context);
    listType = ts.resolveAmbiguousType(listType);

    if (listType is! TypeList? && listType is! TypeVar?) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notAList,
        message: 'Not a list',
        constrains: [],
      );
    }

    if (listReport is ConstraintErrorTypeReport) {
      return listReport.copyWith(
        typesContext: context.clone(),
        recoveryType: listType?.tryAs<TypeList>()?.type,
      );
    }

    if (listType is TypeList? && listType?.type == null) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.ambiguousList,
        message: 'Ambiguous type',
        constrains: [],
      );
    }

    final typeOfList = listType?.tryAs<TypeList>()?.type;
    final type = typeOfList ?? variableGenerator.nextVariable();
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: type,
      constrains: listReport.constrains.followedBy(
        [
          _makeConstraint(listType, TypeList(type: type)),
        ].whereType<Constraints>(),
      ),
    );
  }

  @override
  ConstraintStellaTypeReport? visitTail(TailContext ctx) {
    final listReport = ctx.list!.accept(this)!;

    StellaType? listType = listReport.typeOrNull;
    final ts = TypeSystem.of(context);
    listType = ts.resolveAmbiguousType(listType);

    if (listType is! TypeList? && listType is! TypeVar) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notAList,
        message: 'Not a list',
        constrains: [],
      );
    }

    if (listReport is ConstraintErrorTypeReport) {
      return listReport.copyWith(
        typesContext: context.clone(),
        recoveryType: listType,
      );
    }

    if (listType is TypeList && listType.type == null) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.ambiguousList,
        message: 'Ambiguous type',
        constrains: [],
      );
    }

    StellaType? typeOfList = listType?.tryAs<TypeList>()?.type;
    final type = typeOfList ?? variableGenerator.nextVariable();
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: TypeList(type: type),
      constrains: listReport.constrains.followedBy(
        [
          _makeConstraint(listType, TypeList(type: type)),
        ].whereType<Constraints>(),
      ),
    );
  }

  @override
  ConstraintStellaTypeReport? visitIsEmpty(IsEmptyContext ctx) {
    final listReport = ctx.list!.accept(this)!;

    final listType = listReport.typeOrNull;
    if (listType is! TypeList? && listType is! TypeVar) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.notAList,
        message: 'Not a list',
        constrains: [],
      );
    }

    if (listReport is ConstraintErrorTypeReport) {
      return listReport.copyWith(
        typesContext: context.clone(),
        recoveryType: const Bool(),
      );
    }

    StellaType? typeOfList = listType?.tryAs<TypeList>()?.type;
    final type = typeOfList ?? variableGenerator.nextVariable();
    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
      constrains: listReport.constrains.followedBy(
        [
          _makeConstraint(listType, TypeList(type: type)),
        ].whereType<Constraints>(),
      ),
    );
  }

  @override
  ConstraintStellaTypeReport? visitTypeAsc(TypeAscContext ctx) {
    final expression = ctx.expr_!.accept(this)!;
    final type = ctx.type_!.accept(this)!;

    if (expression is ErrorTypeReport) {
      return expression;
    }

    if (type is ErrorTypeReport) {
      return expression;
    }

    if (!expression.hasType(type.typeOrNull!)) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedExpression(
          context: context,
          expected: expression.typeOrNull!,
          actual: type.typeOrNull,
        ),
        message: 'Bad cast',
        constrains: [],
      );
    }

    return ConstraintGotTypeReport(
      typesContext: context.clone(),
      type: type.typeOrNull!,
      constrains: expression.constrains
          .followedBy(type.constrains)
          .followedBy(
            [
              _makeConstraint(expression.typeOrNull, type.typeOrNull),
            ].whereType<Constraints>(),
          ),
    );
  }

  @override
  ConstraintStellaTypeReport? visitMatch(MatchContext ctx) {
    final expr = ctx.expr_!.accept(this)!;

    StellaType? type = expr.typeOrNull;
    final ts = TypeSystem.of(context);
    type = ts.resolveAmbiguousType(type);

    if (type != null && !type.isStrict) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.ambiguousType(type),
        message: 'Ambiguous type',
        cause: expr,
        constrains: [],
      );
    }

    if (expr is ErrorTypeReport) {
      return expr;
    }

    try {
      final patterns = ctx.cases
          .map((c) => c.pattern_!.accept(StellaPatternVisitor(type))!)
          .toList();

      if (patterns.isEmpty) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.illegalEmptyMatching,
          constrains: [],
        );
      }

      final checker = StellaPatternChecker.forType(type);

      if (!checker.checkExhaustive(patterns)) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.nonExhaustiveMatchPatterns,
          constrains: [],
        );
      }

      List<ConstraintStellaTypeReport> expr =
          ZipIterable(patterns, ctx.cases.map((c) => c.expr_))
              .map((z) {
                return withContext((context) {
                  context.add(z.$1.patternContext);

                  return z.$2!.accept(this)!;
                });
              })
              .whereType<ConstraintStellaTypeReport>()
              .toList();

      if (expr.whereType<ConstraintErrorTypeReport>().firstOrNull
          case final error?) {
        return error;
      }

      expr = expr
          .whereType<ConstraintGotTypeReport>()
          .map((r) {
            return ConstraintGotTypeReport(
              typesContext: r.typesContext,
              type: ts.resolveAmbiguousType(r.type)!,
            );
          })
          .cast<ConstraintStellaTypeReport>()
          .toList();

      if (expr.firstWhereOrNull((e) => !(e.typeOrNull?.isStrict ?? true))
          case final error?) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.ambiguousType(error.typeOrNull!),
          message: 'Ambiguous type',
          constrains: [],
        );
      }

      final clone = context.clone();
      final report = expr.reduce((a, b) => a.inferTypeReport(b, clone));
      return report.copyWith(
        constrains: [
          // todo constrains
        ],
      );
    } on ConstraintErrorTypeReport catch (report) {
      return report;
    } on StateError catch (error) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.duplicateRecordPatternFields,
        message: error.message,
        cause: expr,
        constrains: [],
      );
    } on UnsupportedError catch (error) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedNonNullableVariantPattern,
        message: error.message,
        cause: expr,
        constrains: [],
      );
    } on RangeError catch (error) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedNullableVariantPattern,
        message: error.message,
        cause: expr,
        constrains: [],
      );
    } on ArgumentError catch (error) {
      return ConstraintErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedPatternForType,
        message: error.message,
        cause: expr,
        constrains: [],
      );
    }
  }

  @override
  ConstraintStellaTypeReport? visitLet(LetContext ctx) {
    return withContext((context) {
      try {
        final patterns = ctx.patternBinds.map((c) {
          final expr = c.rhs!.accept(this)!;

          if (expr is ErrorTypeReport) {
            throw expr;
          }

          StellaType? type = expr.typeOrNull;
          final ts = TypeSystem.of(context);
          type = ts.resolveAmbiguousType(type);

          if (type?.isStrict case false) {
            throw ConstraintErrorTypeReport(
              typesContext: context.clone(),
              errorCode: StellaTypeError.ambiguousType(type!),
              message: 'Ambiguous type',
              constrains: [],
            );
          }

          final pattern = c.pat!.accept(StellaPatternVisitor(type))!;
          return (expr, pattern);
        }).toList();

        if (patterns.isEmpty) {
          return ConstraintErrorTypeReport(
            typesContext: context.clone(),
            errorCode: StellaTypeError.illegalEmptyMatching,
            constrains: [],
          );
        }
        final clone = context.clone();
        final typeRes = patterns.firstComponent.reduce(
          (a, b) => a.inferTypeReport(b, clone),
        );

        if (typeRes is ErrorTypeReport) {
          throw typeRes;
        }

        final checker = StellaPatternChecker.forType(typeRes.typeOrNull!);

        if (!checker.checkExhaustive(patterns.secondComponent.toList())) {
          return ConstraintErrorTypeReport(
            typesContext: context.clone(),
            errorCode: StellaTypeError.nonExhaustiveMatchPatterns,
            constrains: [],
          );
        }

        final innerContext = patterns.secondComponent
            .map((p) => p.patternContext)
            .reduce((a, b) => a.merge(b));
        context.add(innerContext);

        return ctx.body!.accept(this)!;
      } on ConstraintErrorTypeReport catch (report) {
        return report;
      } on StateError catch (error) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.duplicateRecordPatternFields,
          message: error.message,
          constrains: [],
        );
      } on UnsupportedError catch (error) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedNonNullableVariantPattern,
          message: error.message,
          constrains: [],
        );
      } on RangeError catch (error) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedNullableVariantPattern,
          message: error.message,
          constrains: [],
        );
      } on ArgumentError catch (error) {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedPatternForType,
          message: error.message,
          constrains: [],
        );
      } on Object {
        return ConstraintErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.ambiguousPatternType,
          constrains: [],
        );
      }
    });
  }

  @override
  ConstraintStellaTypeReport? visitParenthesisedExpr(
    ParenthesisedExprContext ctx,
  ) {
    return ctx.expr_?.accept(this);
  }

  Constraints? _makeConstraint(StellaType? lhs, StellaType? rhs) {
    if (lhs == null || rhs == null) {
      return null;
    }

    if (lhs == rhs) {
      return null;
    }

    if (lhs is! TypeVar && rhs is! TypeVar) {
      return null;
    }

    return Constraints(lhs: lhs, rhs: rhs);
  }
}
