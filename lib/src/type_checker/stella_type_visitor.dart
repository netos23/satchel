import 'package:satchel/src/type_checker/stella_types.dart';

import '../antlr/StellaParser.dart';
import '../antlr/StellaParserBaseVisitor.dart';
import 'stella_type_report.dart';
import 'stella_types_context.dart';

typedef ContextBuilder = StellaTypeReport? Function(StellaTypesContext);

class StellaTypeVisitor extends StellaParserBaseVisitor<StellaTypeReport> {
  StellaTypesContext context;

  StellaTypeVisitor(this.context);

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
    final conditionReport = ctx.condition?.accept(this);

    if (conditionReport != null && !conditionReport.hasType(const Bool())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        cause: conditionReport,
      );
    }

    final thenReport = ctx.thenExpr?.accept(this);
    final elseReport = ctx.thenExpr?.accept(this);

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
    final expReport = ctx.n?.accept(this);

    if (expReport != null && !expReport.hasType(const Nat())) {
      return ErrorTypeReport(
        typesContext: context.clone(),
        cause: expReport,
      );
    }

    return GotTypeReport(
      typesContext: context.clone(),
      type: const Bool(),
    );
  }



}
