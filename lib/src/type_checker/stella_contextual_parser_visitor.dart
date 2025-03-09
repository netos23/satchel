import 'package:antlr4/antlr4.dart';
import 'package:satchel/src/type_checker/stella_types_context.dart';
import '../antlr/StellaParser.dart';
import '../antlr/StellaParserVisitor.dart';

class StellaContextualParserVisitor<T> extends ParseTreeVisitor<T>
    implements StellaParserVisitor<T> {
  @override
  T? visitAbstraction(
    AbstractionContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitAdd(
    AddContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitAnExtension(
    AnExtensionContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitApplication(
    ApplicationContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitAssign(
    AssignContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitBinding(
    BindingContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitConsList(
    ConsListContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitConstFalse(
    ConstFalseContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitConstInt(
    ConstIntContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitConstMemory(
    ConstMemoryContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitConstTrue(
    ConstTrueContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitConstUnit(
    ConstUnitContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDeclExceptionType(
    DeclExceptionTypeContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDeclExceptionVariant(
    DeclExceptionVariantContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDeclFun(
    DeclFunContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDeclFunGeneric(
    DeclFunGenericContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDeclTypeAlias(
    DeclTypeAliasContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDeref(
    DerefContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDivide(
    DivideContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDotRecord(
    DotRecordContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitDotTuple(
    DotTupleContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitEqual(
    EqualContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitFix(
    FixContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitFold(
    FoldContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitGreaterThan(
    GreaterThanContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitGreaterThanOrEqual(
    GreaterThanOrEqualContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitHead(
    HeadContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitIf(
    IfContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitInl(
    InlContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitInlineAnnotation(
    InlineAnnotationContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitInr(
    InrContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitIsEmpty(
    IsEmptyContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitIsZero(
    IsZeroContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLabelledPattern(
    LabelledPatternContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLanguageCore(
    LanguageCoreContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLessThan(
    LessThanContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLessThanOrEqual(
    LessThanOrEqualContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLet(
    LetContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLetRec(
    LetRecContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitList(
    ListContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLogicAnd(
    LogicAndContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLogicNot(
    LogicNotContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitLogicOr(
    LogicOrContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitMatch(
    MatchContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitMatchCase(
    MatchCaseContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitMultiply(
    MultiplyContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitNatRec(
    NatRecContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitNotEqual(
    NotEqualContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPanic(
    PanicContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitParamDeclaration(
    ParamDeclarationContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitParenthesisedExpr(
    ParenthesisedExprContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitParenthesisedPattern(
    ParenthesisedPatternContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternAsc(
    PatternAscContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternBinding(
    PatternBindingContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternCastAs(
    PatternCastAsContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternCons(
    PatternConsContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternFalse(
    PatternFalseContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternInl(
    PatternInlContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternInr(
    PatternInrContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternInt(
    PatternIntContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternList(
    PatternListContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternRecord(
    PatternRecordContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternSucc(
    PatternSuccContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternTrue(
    PatternTrueContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternTuple(
    PatternTupleContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternUnit(
    PatternUnitContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternVar(
    PatternVarContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPatternVariant(
    PatternVariantContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitPred(
    PredContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitProgram(
    ProgramContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitRecord(
    RecordContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitRecordFieldType(
    RecordFieldTypeContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitRef(
    RefContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitSequence(
    SequenceContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitStart_Expr(
    Start_ExprContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitStart_Program(
    Start_ProgramContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitStart_Type(
    Start_TypeContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitSubtract(
    SubtractContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitSucc(
    SuccContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTail(
    TailContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTerminatingSemicolon(
    TerminatingSemicolonContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitThrow(
    ThrowContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTryCastAs(
    TryCastAsContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTryCatch(
    TryCatchContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTryWith(
    TryWithContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTuple(
    TupleContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeAbstraction(
    TypeAbstractionContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeApplication(
    TypeApplicationContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeAsc(
    TypeAscContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeAuto(
    TypeAutoContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeBool(
    TypeBoolContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeBottom(
    TypeBottomContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeCast(
    TypeCastContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeForAll(
    TypeForAllContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeFun(
    TypeFunContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeList(
    TypeListContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeNat(
    TypeNatContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeParens(
    TypeParensContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeRec(
    TypeRecContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeRecord(
    TypeRecordContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeRef(
    TypeRefContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeSum(
    TypeSumContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeTop(
    TypeTopContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeTuple(
    TypeTupleContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeUnit(
    TypeUnitContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeVar(
    TypeVarContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitTypeVariant(
    TypeVariantContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitUnfold(
    UnfoldContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitVar(
    VarContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitVariant(
    VariantContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);

  @override
  T? visitVariantFieldType(
    VariantFieldTypeContext ctx, [
    StellaTypesContext? context,
  ]) =>
      visitChildren(ctx);
}
