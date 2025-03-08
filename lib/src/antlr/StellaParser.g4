parser grammar StellaParser;

options {
    tokenVocab = StellaLexer;
}

start_Program: x = program EOF;
start_Expr: x = expression EOF;
start_Type: x = stellatype EOF;

program:
    languageDecl (exts += extension)* (decls += declaration)*;

languageDecl: 'language' 'core' ';' # LanguageCore;

extension:
    'extend' 'with' extensionNames += ExtensionName (
        ',' extensionNames += ExtensionName
    )* ';' # AnExtension;

declaration: (annots += annotation)* 'fn' name = StellaIdent '(' (
        paramDecls += paramDeclaration (',' paramDecls += paramDeclaration)*
    )? ')' ('->' returnType = stellatype)? (
        'throws' throwTypes+= stellatype (',' throwTypes+=stellatype)*
    )? '{' (localDecls += declaration)* 'return' returnExpr = expression '}' # DeclFun
    | (annots += annotation)* 'generic' 'fn' name = StellaIdent '[' generics += StellaIdent (',' generics += StellaIdent)* ']' '(' (
        paramDecls += paramDeclaration (',' paramDecls += paramDeclaration)*
    )? ')' ('->' returnType = stellatype)? (
        'throws' throwTypes+= stellatype (',' throwTypes+=stellatype)*
    )? '{' (localDecls += declaration)* 'return' returnExpr = expression '}' # DeclFunGeneric
    | 'type' name = StellaIdent '=' atype = stellatype          # DeclTypeAlias
    | 'exception' 'type' '=' exceptionType=stellatype           # DeclExceptionType
    | 'exception' 'variant' name=StellaIdent ':' variantType=stellatype #DeclExceptionVariant;

annotation: 'inline' # InlineAnnotation;
paramDeclaration: name = StellaIdent ':' paramType = stellatype;

expression:
    // expr6
    expr_ = expression '.' label = StellaIdent # DotRecord
    | expr_ = expression '.' index = INTEGER   # DotTuple
    | 'true'                             # ConstTrue
    | 'false'                            # ConstFalse
    | 'unit'                             # ConstUnit
    | n = INTEGER                        # ConstInt
    | mem = MemoryAddress                # ConstMemory
    | name = StellaIdent                 # Var
    // expr
    | 'panic!'                    # Panic
    | 'throw' '(' expr_=expression ')'  # Throw
    | 'try' '{' tryExpr=expression '}' 'catch' '{' pat=pattern '=>' fallbackExpr=expression '}'  # TryCatch
    | 'try' '{' tryExpr=expression '}' 'cast' 'as' type_=stellatype '{' pattern_=pattern '=>' expr_=expression '}'
        'with' '{' fallbackExpr=expression '}'                             # TryCastAs
    | 'try' '{' tryExpr=expression '}' 'with' '{' fallbackExpr=expression '}'  # TryWith
    | 'inl' '(' expr_=expression ')'                     # Inl
    | 'inr' '(' expr_=expression ')'                     # Inr
    | 'cons' '(' head = expression ',' tail = expression ')'                     # ConsList
    | 'List::head' '(' list = expression ')'                               # Head
    | 'List::isempty' '(' list = expression ')'                            # IsEmpty
    | 'List::tail' '(' list = expression ')'                               # Tail
    | 'succ' '(' n = expression ')'                                        # Succ
    | 'not' '(' expr_ = expression ')'                                     # LogicNot
    | 'Nat::pred' '(' n = expression ')'                                   # Pred
    | 'Nat::iszero' '(' n = expression ')'                                 # IsZero
    | 'fix' '(' expr_ = expression ')'                                     # Fix
    | 'Nat::rec' '(' n = expression ',' initial = expression ',' step = expression ')' # NatRec
    | 'fold' '[' type_ = stellatype ']' expr_ = expression                 # Fold
    | 'unfold' '[' type_ = stellatype ']' expr_ = expression               # Unfold
    // expr
    | fun = expression '(' (args += expression (',' args += expression)*)? ')' # Application
    | fun = expression '[' (types += stellatype (',' types += stellatype)*) ']'                     # TypeApplication
    // expr
    | left=expression '*' right=expression   # Multiply
    | left=expression '/' right=expression   # Divide
    | left=expression 'and' right=expression # LogicAnd
    | 'new' expr_=expression # Ref
    | '*' expr_=expression   # Deref
    // expr
    | left=expression '+' right=expression                        # Add
    | left=expression '-' right=expression                        # Subtract
    | left=expression 'or' right=expression                       # LogicOr
    | expr_ = expression 'as' type_ = stellatype # TypeAsc
    | expr_ = expression 'cast' 'as' type_ = stellatype # TypeCast
    | 'fn' '(' (
        paramDecls += paramDeclaration (',' paramDecls += paramDeclaration)*
    )? ')' '{' 'return' returnExpr = expression '}'       # Abstraction
    | '{' (exprs += expression (',' exprs += expression)*)? '}' # Tuple
    | '{' binds += binding (',' binds += binding)* '}' # Record
    | '<|' label = StellaIdent ('=' rhs = expression)? '|>' # Variant
    | 'match' expr_ = expression '{' (
        cases += matchCase ('|' cases += matchCase)*
    )? '}'                                         # Match
    | '[' (exprs += expression (',' exprs += expression)*)? ']' # List
    // expr
    | left = expression '<' right = expression  # LessThan
    | left = expression '<=' right = expression # LessThanOrEqual
    | left = expression '>' right = expression  # GreaterThan
    | left = expression '>=' right = expression # GreaterThanOrEqual
    | left = expression '==' right = expression # Equal
    | left = expression '!=' right = expression # NotEqual
    // expr
    | lhs = expression ':=' rhs = expression # Assign
    | 'if' condition = expression 'then' thenExpr = expression 'else' elseExpr = expression # If
    | expr1 = expression ';' expr2 = expression # Sequence
    | 'let' patternBinds+=patternBinding (',' patternBinds+=patternBinding)* 'in' body = expression           # Let
    | 'letrec' patternBinds+=patternBinding (',' patternBinds+=patternBinding)* 'in' body = expression           # LetRec
    | 'generic' '[' generics += StellaIdent (',' generics += StellaIdent)* ']' expr_ = expression                           # TypeAbstraction
    | '(' expr_ = expression ')'                                                        # ParenthesisedExpr
    | expr_ = expression ';' # TerminatingSemicolon
    ;

patternBinding: pat=pattern '=' rhs=expression ;

binding: name = StellaIdent '=' rhs = expression;

matchCase: pattern_ = pattern '=>' expr_ = expression;

pattern:
    '<|' label = StellaIdent ('=' pattern_ = pattern)? '|>'     # PatternVariant
    | 'inl' '(' pattern_ = pattern ')' # PatternInl
    | 'inr' '(' pattern_ = pattern ')' # PatternInr
    | '{' (pttrs += pattern (',' pttrs += pattern)*)? '}' # PatternTuple
    | '{' (
        pttrs += labelledPattern (
            ',' pttrs += labelledPattern
        )*
    )? '}'                                                      # PatternRecord
    | '[' (pttrs += pattern (',' pttrs += pattern)*)? ']' # PatternList
    | 'cons' '(' head = pattern ',' tail = pattern ')'          # PatternCons
    | 'false'                                                   # PatternFalse
    | 'true'                                                    # PatternTrue
    | 'unit'                                                    # PatternUnit
    | n = INTEGER                                               # PatternInt
    | 'succ' '(' pattern_ = pattern ')'                         # PatternSucc
    | name = StellaIdent                                        # PatternVar
    | pattern_ = pattern 'as' type_ = stellatype                # PatternAsc
    | pattern_ = pattern 'cast' 'as' type_ = stellatype         # PatternCastAs
    | '(' pattern_ = pattern ')'                                # ParenthesisedPattern;

labelledPattern: label = StellaIdent '=' pattern_ = pattern;

stellatype:
    'Bool'  # TypeBool
    | 'Nat' # TypeNat
    | '&' type_=stellatype                                     # TypeRef
    | left = stellatype '+' right = stellatype                 # TypeSum
    | 'fn' '(' (
        paramTypes += stellatype (',' paramTypes += stellatype)*
    )? ')' '->' returnType = stellatype                        # TypeFun
    | 'forall' (types += StellaIdent)* '.' type_ = stellatype          # TypeForAll
    | 'µ' var = StellaIdent '.' type_ = stellatype             # TypeRec
    | '{' (types += stellatype (',' types += stellatype)*)? '}' # TypeTuple
    | '{'
        fieldTypes += recordFieldType (
            ',' fieldTypes += recordFieldType
        )*
     '}' # TypeRecord
    | '<|' (
        fieldTypes += variantFieldType (
            ',' fieldTypes += variantFieldType
        )*
    )? '|>'                                                     # TypeVariant
    | '[' type_ = stellatype ']' # TypeList
    | 'Unit'                                                    # TypeUnit
    | 'Top'                                                     # TypeTop
    | 'Bot'                                                     # TypeBottom
    | 'auto'                                                    # TypeAuto
    | name = StellaIdent                                        # TypeVar
    | '(' type_ = stellatype ')' # TypeParens;

recordFieldType: label = StellaIdent ':' type_ = stellatype;
variantFieldType: label = StellaIdent (':' type_ = stellatype)?;
