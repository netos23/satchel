// Generated from ./lib/src/antlr/StellaParser.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'StellaParser.dart';

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [StellaParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class StellaParserVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [StellaParser.start_Program].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitStart_Program(Start_ProgramContext ctx);

  /// Visit a parse tree produced by [StellaParser.start_Expr].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitStart_Expr(Start_ExprContext ctx);

  /// Visit a parse tree produced by [StellaParser.start_Type].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitStart_Type(Start_TypeContext ctx);

  /// Visit a parse tree produced by [StellaParser.program].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitProgram(ProgramContext ctx);

  /// Visit a parse tree produced by the {@code LanguageCore}
  /// labeled alternative in {@link StellaParser#languageDecl}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLanguageCore(LanguageCoreContext ctx);

  /// Visit a parse tree produced by the {@code AnExtension}
  /// labeled alternative in {@link StellaParser#extension}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitAnExtension(AnExtensionContext ctx);

  /// Visit a parse tree produced by the {@code DeclFun}
  /// labeled alternative in {@link StellaParser#declaration}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDeclFun(DeclFunContext ctx);

  /// Visit a parse tree produced by the {@code DeclFunGeneric}
  /// labeled alternative in {@link StellaParser#declaration}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDeclFunGeneric(DeclFunGenericContext ctx);

  /// Visit a parse tree produced by the {@code DeclTypeAlias}
  /// labeled alternative in {@link StellaParser#declaration}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDeclTypeAlias(DeclTypeAliasContext ctx);

  /// Visit a parse tree produced by the {@code DeclExceptionType}
  /// labeled alternative in {@link StellaParser#declaration}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDeclExceptionType(DeclExceptionTypeContext ctx);

  /// Visit a parse tree produced by the {@code DeclExceptionVariant}
  /// labeled alternative in {@link StellaParser#declaration}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDeclExceptionVariant(DeclExceptionVariantContext ctx);

  /// Visit a parse tree produced by the {@code InlineAnnotation}
  /// labeled alternative in {@link StellaParser#annotation}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitInlineAnnotation(InlineAnnotationContext ctx);

  /// Visit a parse tree produced by [StellaParser.paramDeclaration].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitParamDeclaration(ParamDeclarationContext ctx);

  /// Visit a parse tree produced by the {@code Fold}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFold(FoldContext ctx);

  /// Visit a parse tree produced by the {@code Add}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitAdd(AddContext ctx);

  /// Visit a parse tree produced by the {@code IsZero}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIsZero(IsZeroContext ctx);

  /// Visit a parse tree produced by the {@code Var}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVar(VarContext ctx);

  /// Visit a parse tree produced by the {@code TypeAbstraction}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeAbstraction(TypeAbstractionContext ctx);

  /// Visit a parse tree produced by the {@code Divide}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDivide(DivideContext ctx);

  /// Visit a parse tree produced by the {@code LessThan}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLessThan(LessThanContext ctx);

  /// Visit a parse tree produced by the {@code DotRecord}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDotRecord(DotRecordContext ctx);

  /// Visit a parse tree produced by the {@code GreaterThan}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitGreaterThan(GreaterThanContext ctx);

  /// Visit a parse tree produced by the {@code Equal}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitEqual(EqualContext ctx);

  /// Visit a parse tree produced by the {@code Throw}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitThrow(ThrowContext ctx);

  /// Visit a parse tree produced by the {@code Multiply}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMultiply(MultiplyContext ctx);

  /// Visit a parse tree produced by the {@code ConstMemory}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitConstMemory(ConstMemoryContext ctx);

  /// Visit a parse tree produced by the {@code List}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitList(ListContext ctx);

  /// Visit a parse tree produced by the {@code TryCatch}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTryCatch(TryCatchContext ctx);

  /// Visit a parse tree produced by the {@code TryCastAs}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTryCastAs(TryCastAsContext ctx);

  /// Visit a parse tree produced by the {@code Head}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitHead(HeadContext ctx);

  /// Visit a parse tree produced by the {@code TerminatingSemicolon}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTerminatingSemicolon(TerminatingSemicolonContext ctx);

  /// Visit a parse tree produced by the {@code NotEqual}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitNotEqual(NotEqualContext ctx);

  /// Visit a parse tree produced by the {@code ConstUnit}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitConstUnit(ConstUnitContext ctx);

  /// Visit a parse tree produced by the {@code Sequence}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSequence(SequenceContext ctx);

  /// Visit a parse tree produced by the {@code ConstFalse}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitConstFalse(ConstFalseContext ctx);

  /// Visit a parse tree produced by the {@code Abstraction}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitAbstraction(AbstractionContext ctx);

  /// Visit a parse tree produced by the {@code ConstInt}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitConstInt(ConstIntContext ctx);

  /// Visit a parse tree produced by the {@code Variant}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVariant(VariantContext ctx);

  /// Visit a parse tree produced by the {@code ConstTrue}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitConstTrue(ConstTrueContext ctx);

  /// Visit a parse tree produced by the {@code Subtract}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSubtract(SubtractContext ctx);

  /// Visit a parse tree produced by the {@code TypeCast}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeCast(TypeCastContext ctx);

  /// Visit a parse tree produced by the {@code If}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIf(IfContext ctx);

  /// Visit a parse tree produced by the {@code Application}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitApplication(ApplicationContext ctx);

  /// Visit a parse tree produced by the {@code Deref}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDeref(DerefContext ctx);

  /// Visit a parse tree produced by the {@code IsEmpty}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIsEmpty(IsEmptyContext ctx);

  /// Visit a parse tree produced by the {@code Panic}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPanic(PanicContext ctx);

  /// Visit a parse tree produced by the {@code LessThanOrEqual}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLessThanOrEqual(LessThanOrEqualContext ctx);

  /// Visit a parse tree produced by the {@code Succ}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSucc(SuccContext ctx);

  /// Visit a parse tree produced by the {@code Inl}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitInl(InlContext ctx);

  /// Visit a parse tree produced by the {@code GreaterThanOrEqual}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitGreaterThanOrEqual(GreaterThanOrEqualContext ctx);

  /// Visit a parse tree produced by the {@code Inr}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitInr(InrContext ctx);

  /// Visit a parse tree produced by the {@code Match}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMatch(MatchContext ctx);

  /// Visit a parse tree produced by the {@code LogicNot}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLogicNot(LogicNotContext ctx);

  /// Visit a parse tree produced by the {@code ParenthesisedExpr}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitParenthesisedExpr(ParenthesisedExprContext ctx);

  /// Visit a parse tree produced by the {@code Tail}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTail(TailContext ctx);

  /// Visit a parse tree produced by the {@code Record}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitRecord(RecordContext ctx);

  /// Visit a parse tree produced by the {@code LogicAnd}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLogicAnd(LogicAndContext ctx);

  /// Visit a parse tree produced by the {@code TypeApplication}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeApplication(TypeApplicationContext ctx);

  /// Visit a parse tree produced by the {@code LetRec}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLetRec(LetRecContext ctx);

  /// Visit a parse tree produced by the {@code LogicOr}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLogicOr(LogicOrContext ctx);

  /// Visit a parse tree produced by the {@code TryWith}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTryWith(TryWithContext ctx);

  /// Visit a parse tree produced by the {@code Pred}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPred(PredContext ctx);

  /// Visit a parse tree produced by the {@code TypeAsc}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeAsc(TypeAscContext ctx);

  /// Visit a parse tree produced by the {@code NatRec}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitNatRec(NatRecContext ctx);

  /// Visit a parse tree produced by the {@code Unfold}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitUnfold(UnfoldContext ctx);

  /// Visit a parse tree produced by the {@code Ref}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitRef(RefContext ctx);

  /// Visit a parse tree produced by the {@code DotTuple}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDotTuple(DotTupleContext ctx);

  /// Visit a parse tree produced by the {@code Fix}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFix(FixContext ctx);

  /// Visit a parse tree produced by the {@code Let}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLet(LetContext ctx);

  /// Visit a parse tree produced by the {@code Assign}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitAssign(AssignContext ctx);

  /// Visit a parse tree produced by the {@code Tuple}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTuple(TupleContext ctx);

  /// Visit a parse tree produced by the {@code ConsList}
  /// labeled alternative in {@link StellaParser#expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitConsList(ConsListContext ctx);

  /// Visit a parse tree produced by [StellaParser.patternBinding].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternBinding(PatternBindingContext ctx);

  /// Visit a parse tree produced by [StellaParser.binding].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitBinding(BindingContext ctx);

  /// Visit a parse tree produced by [StellaParser.matchCase].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitMatchCase(MatchCaseContext ctx);

  /// Visit a parse tree produced by the {@code PatternCons}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternCons(PatternConsContext ctx);

  /// Visit a parse tree produced by the {@code PatternTuple}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternTuple(PatternTupleContext ctx);

  /// Visit a parse tree produced by the {@code PatternList}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternList(PatternListContext ctx);

  /// Visit a parse tree produced by the {@code PatternRecord}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternRecord(PatternRecordContext ctx);

  /// Visit a parse tree produced by the {@code PatternVariant}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternVariant(PatternVariantContext ctx);

  /// Visit a parse tree produced by the {@code PatternAsc}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternAsc(PatternAscContext ctx);

  /// Visit a parse tree produced by the {@code PatternInt}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternInt(PatternIntContext ctx);

  /// Visit a parse tree produced by the {@code PatternInr}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternInr(PatternInrContext ctx);

  /// Visit a parse tree produced by the {@code PatternTrue}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternTrue(PatternTrueContext ctx);

  /// Visit a parse tree produced by the {@code PatternInl}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternInl(PatternInlContext ctx);

  /// Visit a parse tree produced by the {@code PatternVar}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternVar(PatternVarContext ctx);

  /// Visit a parse tree produced by the {@code ParenthesisedPattern}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitParenthesisedPattern(ParenthesisedPatternContext ctx);

  /// Visit a parse tree produced by the {@code PatternSucc}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternSucc(PatternSuccContext ctx);

  /// Visit a parse tree produced by the {@code PatternFalse}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternFalse(PatternFalseContext ctx);

  /// Visit a parse tree produced by the {@code PatternUnit}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternUnit(PatternUnitContext ctx);

  /// Visit a parse tree produced by the {@code PatternCastAs}
  /// labeled alternative in {@link StellaParser#pattern}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPatternCastAs(PatternCastAsContext ctx);

  /// Visit a parse tree produced by [StellaParser.labelledPattern].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitLabelledPattern(LabelledPatternContext ctx);

  /// Visit a parse tree produced by the {@code TypeTuple}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeTuple(TypeTupleContext ctx);

  /// Visit a parse tree produced by the {@code TypeTop}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeTop(TypeTopContext ctx);

  /// Visit a parse tree produced by the {@code TypeBool}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeBool(TypeBoolContext ctx);

  /// Visit a parse tree produced by the {@code TypeRef}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeRef(TypeRefContext ctx);

  /// Visit a parse tree produced by the {@code TypeRec}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeRec(TypeRecContext ctx);

  /// Visit a parse tree produced by the {@code TypeAuto}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeAuto(TypeAutoContext ctx);

  /// Visit a parse tree produced by the {@code TypeSum}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeSum(TypeSumContext ctx);

  /// Visit a parse tree produced by the {@code TypeVar}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeVar(TypeVarContext ctx);

  /// Visit a parse tree produced by the {@code TypeVariant}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeVariant(TypeVariantContext ctx);

  /// Visit a parse tree produced by the {@code TypeUnit}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeUnit(TypeUnitContext ctx);

  /// Visit a parse tree produced by the {@code TypeNat}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeNat(TypeNatContext ctx);

  /// Visit a parse tree produced by the {@code TypeBottom}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeBottom(TypeBottomContext ctx);

  /// Visit a parse tree produced by the {@code TypeParens}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeParens(TypeParensContext ctx);

  /// Visit a parse tree produced by the {@code TypeFun}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeFun(TypeFunContext ctx);

  /// Visit a parse tree produced by the {@code TypeForAll}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeForAll(TypeForAllContext ctx);

  /// Visit a parse tree produced by the {@code TypeRecord}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeRecord(TypeRecordContext ctx);

  /// Visit a parse tree produced by the {@code TypeList}
  /// labeled alternative in {@link StellaParser#stellatype}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitTypeList(TypeListContext ctx);

  /// Visit a parse tree produced by [StellaParser.recordFieldType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitRecordFieldType(RecordFieldTypeContext ctx);

  /// Visit a parse tree produced by [StellaParser.variantFieldType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitVariantFieldType(VariantFieldTypeContext ctx);
}
