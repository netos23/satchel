import 'package:collection/collection.dart';
import 'package:satchel/src/util/extensions.dart';
import 'package:satchel/src/util/iterable.dart';

import '../../antlr/StellaParser.dart';
import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_type_report.dart';
import '../model/stella_types.dart';
import '../model/stella_types_context.dart';
import 'stella_types_mapper_visitor.dart';

typedef ContextBuilder = StellaTypeReport? Function(StellaTypesContext);

class StellaTypeVisitor extends StellaParserBaseVisitor<StellaTypeReport> {
  StellaTypesContext context;

  StellaTypeVisitor(this.context);

  @override
  StellaTypeReport? aggregateResult(
    StellaTypeReport? aggregate,
    StellaTypeReport? nextResult,
  ) {
    if(nextResult is ErrorTypeReport){
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
            name: name,
          ),
        );
      }

      return GotTypeReport(
        typesContext: context.clone(),
        type: Func(
          args: type.args,
          returnType: type.returnType,
          name: name,
        ),
      );
    });
  }

  @override
  StellaTypeReport? visitAbstraction(AbstractionContext ctx) {
    return withContext((context) {
      var paramDecls = ctx.paramDecls;

      final argNames = paramDecls.map(
        (decl) => decl.name!.text!,
      );
      final argTypes = paramDecls.map(
        (decl) => decl.paramType!.accept(StellaTypesMapperVisitor())!,
      );

      for (final (name, type) in ZipIterable(argNames, argTypes)) {
        context[name] = type;
      }

      final retExp = ctx.returnExpr!.accept(this)!;

      return switch (retExp) {
        GotTypeReport(:final type) => GotTypeReport(
            typesContext: context.clone(),
            type: Func(
              args: argTypes.toList(),
              returnType: type,
            ),
          ),
        _ => retExp,
      };
    });
  }

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
            actual: actualTypeReport.tryAs<GotTypeReport>()?.type,
          ),
          message: actualTypeReport.tryAs<GotTypeReport>()?.let(
              (it) => 'Expected type $expected, but got ${type.returnType}'),
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
}
