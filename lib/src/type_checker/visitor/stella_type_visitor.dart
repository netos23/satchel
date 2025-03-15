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

    if (!conditionReport.hasType(const Bool())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedTypeForExpression,
        message: conditionReport
            .tryAs<GotTypeReport>()
            ?.let((it) => 'Expected type Bool, but got ${it.type}'),
        cause: conditionReport,
      );
    }

    final thenReport = ctx.thenExpr?.accept(this);
    final elseReport = ctx.elseExpr?.accept(this);

    return switch ((thenReport, elseReport)) {
      (StellaTypeReport then, StellaTypeReport elze) =>
        then.inferTypeReport(elze, context.clone()),
      (StellaTypeReport then, null) => then,
      (null, StellaTypeReport elze) => elze,
      (_, _) => UnknownTypeReport(typesContext: context.clone()),
    };
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
    final expReport = ctx.n?.accept(this);

    if (expReport != null && !expReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedTypeForExpression,
        message: expReport
            .tryAs<GotTypeReport>()
            ?.let((it) => 'Expected type Nat, but got ${it.type}'),
        cause: expReport,
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
    final expReport = ctx.n?.accept(this);

    if (expReport != null && !expReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedTypeForExpression,
        message: expReport
            .tryAs<GotTypeReport>()
            ?.let((it) => 'Expected type Nat, but got ${it.type}'),
        cause: expReport,
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
        errorCode: StellaTypeError.unexpectedTypeForExpression,
        message: expReport
            .tryAs<GotTypeReport>()
            ?.let((it) => 'Expected type Nat, but got ${it.type}'),
        cause: expReport,
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

    if (!counterReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.unexpectedTypeForExpression,
        message: counterReport
            .tryAs<GotTypeReport>()
            ?.let((it) => 'Expected type Nat, but got ${it.type}'),
        cause: counterReport,
      );
    }

    final initReport = ctx.initial!.accept(this)!;
    final stepReport = ctx.step!.accept(this)!;

    return switch (initReport) {
      GotTypeReport(:final type) => stepReport.hasType(Nat() >> (type >> type))
          ? GotTypeReport(typesContext: context.clone(), type: type)
          : ErrorTypeReport(
              typesContext: context.clone(),
              errorCode: StellaTypeError.unexpectedTypeForExpression,
              message: counterReport.tryAs<GotTypeReport>()?.let((it) =>
                  'Expected type Nat -> ($type -> $type), but got ${it.type}'),
              cause: initReport,
            ),
      _ => initReport,
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
          errorCode: StellaTypeError.unexpectedTypeForExpression,
          message: retExp
              .tryAs<GotTypeReport>()
              ?.let((it) => 'Expected type Nat, but got ${type.returnType}'),
          cause: retExp,
        );
      }

      return GotTypeReport(
        typesContext: context.clone(),
        type: type,
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
            type: Func(args: argTypes.toList(), returnType: type),
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
          message: 'Can`t apply arguments, to not a function type');
    }

    if (type.args.length != ctx.args.length) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        errorCode: StellaTypeError.incorrectNumberOfArguments,
        message: 'Expect ${type.args.length} args, but got ${ctx.args.length}',
      );
    }

    for (final (expected, actual) in ZipIterable(type.args, ctx.args)) {
      final actualTypeReport = actual.accept(this)!;

      if (!actualTypeReport.hasType(expected)) {
        return ErrorTypeReport(
          typesContext: context.clone(),
          errorCode: StellaTypeError.unexpectedTypeForExpression,
          message: actualTypeReport.tryAs<GotTypeReport>()?.let(
              (it) => 'Expected type $expected, but got ${type.returnType}'),
          cause: actualTypeReport,
        );
      }
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: type.returnType,
    );
  }
}
