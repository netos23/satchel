// Generated from ./lib/src/antlr/StellaParser.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'StellaParserListener.dart';
import 'StellaParserBaseListener.dart';
const int RULE_start_Program = 0, RULE_start_Expr = 1, RULE_start_Type = 2, 
          RULE_program = 3, RULE_languageDecl = 4, RULE_extension = 5, RULE_declaration = 6, 
          RULE_annotation = 7, RULE_paramDeclaration = 8, RULE_expression = 9, 
          RULE_patternBinding = 10, RULE_binding = 11, RULE_matchCase = 12, 
          RULE_pattern = 13, RULE_labelledPattern = 14, RULE_stellatype = 15, 
          RULE_recordFieldType = 16, RULE_variantFieldType = 17;
class StellaParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.2', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_Surrogate_id_SYMB_0 = 1, TOKEN_Surrogate_id_SYMB_1 = 2, 
                   TOKEN_Surrogate_id_SYMB_2 = 3, TOKEN_Surrogate_id_SYMB_3 = 4, 
                   TOKEN_Surrogate_id_SYMB_4 = 5, TOKEN_Surrogate_id_SYMB_5 = 6, 
                   TOKEN_Surrogate_id_SYMB_6 = 7, TOKEN_Surrogate_id_SYMB_7 = 8, 
                   TOKEN_Surrogate_id_SYMB_8 = 9, TOKEN_Surrogate_id_SYMB_9 = 10, 
                   TOKEN_Surrogate_id_SYMB_10 = 11, TOKEN_Surrogate_id_SYMB_11 = 12, 
                   TOKEN_Surrogate_id_SYMB_12 = 13, TOKEN_Surrogate_id_SYMB_13 = 14, 
                   TOKEN_Surrogate_id_SYMB_14 = 15, TOKEN_Surrogate_id_SYMB_15 = 16, 
                   TOKEN_Surrogate_id_SYMB_16 = 17, TOKEN_Surrogate_id_SYMB_17 = 18, 
                   TOKEN_Surrogate_id_SYMB_18 = 19, TOKEN_Surrogate_id_SYMB_19 = 20, 
                   TOKEN_Surrogate_id_SYMB_20 = 21, TOKEN_Surrogate_id_SYMB_21 = 22, 
                   TOKEN_Surrogate_id_SYMB_22 = 23, TOKEN_Surrogate_id_SYMB_23 = 24, 
                   TOKEN_Surrogate_id_SYMB_24 = 25, TOKEN_Surrogate_id_SYMB_25 = 26, 
                   TOKEN_Surrogate_id_SYMB_26 = 27, TOKEN_Surrogate_id_SYMB_27 = 28, 
                   TOKEN_Surrogate_id_SYMB_28 = 29, TOKEN_Surrogate_id_SYMB_29 = 30, 
                   TOKEN_Surrogate_id_SYMB_30 = 31, TOKEN_Surrogate_id_SYMB_31 = 32, 
                   TOKEN_Surrogate_id_SYMB_32 = 33, TOKEN_Surrogate_id_SYMB_33 = 34, 
                   TOKEN_Surrogate_id_SYMB_34 = 35, TOKEN_Surrogate_id_SYMB_35 = 36, 
                   TOKEN_Surrogate_id_SYMB_36 = 37, TOKEN_Surrogate_id_SYMB_37 = 38, 
                   TOKEN_Surrogate_id_SYMB_38 = 39, TOKEN_Surrogate_id_SYMB_39 = 40, 
                   TOKEN_Surrogate_id_SYMB_40 = 41, TOKEN_Surrogate_id_SYMB_41 = 42, 
                   TOKEN_Surrogate_id_SYMB_42 = 43, TOKEN_Surrogate_id_SYMB_43 = 44, 
                   TOKEN_Surrogate_id_SYMB_44 = 45, TOKEN_Surrogate_id_SYMB_45 = 46, 
                   TOKEN_Surrogate_id_SYMB_46 = 47, TOKEN_Surrogate_id_SYMB_47 = 48, 
                   TOKEN_Surrogate_id_SYMB_48 = 49, TOKEN_Surrogate_id_SYMB_49 = 50, 
                   TOKEN_Surrogate_id_SYMB_50 = 51, TOKEN_Surrogate_id_SYMB_51 = 52, 
                   TOKEN_Surrogate_id_SYMB_52 = 53, TOKEN_Surrogate_id_SYMB_53 = 54, 
                   TOKEN_Surrogate_id_SYMB_54 = 55, TOKEN_Surrogate_id_SYMB_55 = 56, 
                   TOKEN_Surrogate_id_SYMB_56 = 57, TOKEN_Surrogate_id_SYMB_57 = 58, 
                   TOKEN_Surrogate_id_SYMB_58 = 59, TOKEN_Surrogate_id_SYMB_59 = 60, 
                   TOKEN_Surrogate_id_SYMB_60 = 61, TOKEN_Surrogate_id_SYMB_61 = 62, 
                   TOKEN_Surrogate_id_SYMB_62 = 63, TOKEN_Surrogate_id_SYMB_63 = 64, 
                   TOKEN_Surrogate_id_SYMB_64 = 65, TOKEN_Surrogate_id_SYMB_65 = 66, 
                   TOKEN_EXCEPTION = 67, TOKEN_VARIANT = 68, TOKEN_CAST = 69, 
                   TOKEN_ASSIGN = 70, TOKEN_REF_TYPE = 71, TOKEN_REFERENCE = 72, 
                   TOKEN_PANIC = 73, TOKEN_THROW = 74, TOKEN_TRY = 75, TOKEN_CATCH = 76, 
                   TOKEN_TOP_TYPE = 77, TOKEN_BOTTOM_TYPE = 78, TOKEN_AUTO_TYPE = 79, 
                   TOKEN_GENERIC = 80, TOKEN_FORALL = 81, TOKEN_COMMENT_antlr_builtin = 82, 
                   TOKEN_MULTICOMMENT_antlr_builtin = 83, TOKEN_StellaIdent = 84, 
                   TOKEN_ExtensionName = 85, TOKEN_MemoryAddress = 86, TOKEN_INTEGER = 87, 
                   TOKEN_WS = 88, TOKEN_ErrorToken = 89;

  @override
  final List<String> ruleNames = [
    'start_Program', 'start_Expr', 'start_Type', 'program', 'languageDecl', 
    'extension', 'declaration', 'annotation', 'paramDeclaration', 'expression', 
    'patternBinding', 'binding', 'matchCase', 'pattern', 'labelledPattern', 
    'stellatype', 'recordFieldType', 'variantFieldType'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "','", "';'", "'('", "')'", "'{'", "'}'", "'='", "':'", "'->'", 
      "'=>'", "'|'", "'<|'", "'|>'", "'['", "']'", "'<'", "'<='", "'>'", 
      "'>='", "'=='", "'!='", "'+'", "'-'", "'*'", "'/'", "'.'", "'List::head'", 
      "'List::isempty'", "'List::tail'", "'Nat::pred'", "'Nat::iszero'", 
      "'Nat::rec'", "'Bool'", "'Nat'", "'Unit'", "'and'", "'as'", "'cons'", 
      "'core'", "'else'", "'extend'", "'false'", "'fix'", "'fn'", "'fold'", 
      "'if'", "'in'", "'inl'", "'inline'", "'inr'", "'language'", "'let'", 
      "'letrec'", "'match'", "'not'", "'or'", "'return'", "'succ'", "'then'", 
      "'throws'", "'true'", "'type'", "'unfold'", "'unit'", "'with'", "'\\u00B5'", 
      "'exception'", "'variant'", "'cast'", "':='", "'&'", "'new'", "'panic!'", 
      "'throw'", "'try'", "'catch'", "'Top'", "'Bot'", "'auto'", "'generic'", 
      "'forall'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, "Surrogate_id_SYMB_0", "Surrogate_id_SYMB_1", "Surrogate_id_SYMB_2", 
      "Surrogate_id_SYMB_3", "Surrogate_id_SYMB_4", "Surrogate_id_SYMB_5", 
      "Surrogate_id_SYMB_6", "Surrogate_id_SYMB_7", "Surrogate_id_SYMB_8", 
      "Surrogate_id_SYMB_9", "Surrogate_id_SYMB_10", "Surrogate_id_SYMB_11", 
      "Surrogate_id_SYMB_12", "Surrogate_id_SYMB_13", "Surrogate_id_SYMB_14", 
      "Surrogate_id_SYMB_15", "Surrogate_id_SYMB_16", "Surrogate_id_SYMB_17", 
      "Surrogate_id_SYMB_18", "Surrogate_id_SYMB_19", "Surrogate_id_SYMB_20", 
      "Surrogate_id_SYMB_21", "Surrogate_id_SYMB_22", "Surrogate_id_SYMB_23", 
      "Surrogate_id_SYMB_24", "Surrogate_id_SYMB_25", "Surrogate_id_SYMB_26", 
      "Surrogate_id_SYMB_27", "Surrogate_id_SYMB_28", "Surrogate_id_SYMB_29", 
      "Surrogate_id_SYMB_30", "Surrogate_id_SYMB_31", "Surrogate_id_SYMB_32", 
      "Surrogate_id_SYMB_33", "Surrogate_id_SYMB_34", "Surrogate_id_SYMB_35", 
      "Surrogate_id_SYMB_36", "Surrogate_id_SYMB_37", "Surrogate_id_SYMB_38", 
      "Surrogate_id_SYMB_39", "Surrogate_id_SYMB_40", "Surrogate_id_SYMB_41", 
      "Surrogate_id_SYMB_42", "Surrogate_id_SYMB_43", "Surrogate_id_SYMB_44", 
      "Surrogate_id_SYMB_45", "Surrogate_id_SYMB_46", "Surrogate_id_SYMB_47", 
      "Surrogate_id_SYMB_48", "Surrogate_id_SYMB_49", "Surrogate_id_SYMB_50", 
      "Surrogate_id_SYMB_51", "Surrogate_id_SYMB_52", "Surrogate_id_SYMB_53", 
      "Surrogate_id_SYMB_54", "Surrogate_id_SYMB_55", "Surrogate_id_SYMB_56", 
      "Surrogate_id_SYMB_57", "Surrogate_id_SYMB_58", "Surrogate_id_SYMB_59", 
      "Surrogate_id_SYMB_60", "Surrogate_id_SYMB_61", "Surrogate_id_SYMB_62", 
      "Surrogate_id_SYMB_63", "Surrogate_id_SYMB_64", "Surrogate_id_SYMB_65", 
      "EXCEPTION", "VARIANT", "CAST", "ASSIGN", "REF_TYPE", "REFERENCE", 
      "PANIC", "THROW", "TRY", "CATCH", "TOP_TYPE", "BOTTOM_TYPE", "AUTO_TYPE", 
      "GENERIC", "FORALL", "COMMENT_antlr_builtin", "MULTICOMMENT_antlr_builtin", 
      "StellaIdent", "ExtensionName", "MemoryAddress", "INTEGER", "WS", 
      "ErrorToken"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'StellaParser.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  StellaParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  Start_ProgramContext start_Program() {
    dynamic _localctx = Start_ProgramContext(context, state);
    enterRule(_localctx, 0, RULE_start_Program);
    try {
      enterOuterAlt(_localctx, 1);
      state = 36;
      _localctx.x = program();
      state = 37;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Start_ExprContext start_Expr() {
    dynamic _localctx = Start_ExprContext(context, state);
    enterRule(_localctx, 2, RULE_start_Expr);
    try {
      enterOuterAlt(_localctx, 1);
      state = 39;
      _localctx.x = expression(0);
      state = 40;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Start_TypeContext start_Type() {
    dynamic _localctx = Start_TypeContext(context, state);
    enterRule(_localctx, 4, RULE_start_Type);
    try {
      enterOuterAlt(_localctx, 1);
      state = 42;
      _localctx.x = stellatype(0);
      state = 43;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ProgramContext program() {
    dynamic _localctx = ProgramContext(context, state);
    enterRule(_localctx, 6, RULE_program);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 45;
      languageDecl();
      state = 49;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_Surrogate_id_SYMB_40) {
        state = 46;
        _localctx._extension = extension();
        _localctx.exts.add(_localctx._extension);
        state = 51;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 55;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 68728127521) != 0)) {
        state = 52;
        _localctx._declaration = declaration();
        _localctx.decls.add(_localctx._declaration);
        state = 57;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LanguageDeclContext languageDecl() {
    dynamic _localctx = LanguageDeclContext(context, state);
    enterRule(_localctx, 8, RULE_languageDecl);
    try {
      _localctx = LanguageCoreContext(_localctx);
      enterOuterAlt(_localctx, 1);
      state = 58;
      match(TOKEN_Surrogate_id_SYMB_50);
      state = 59;
      match(TOKEN_Surrogate_id_SYMB_38);
      state = 60;
      match(TOKEN_Surrogate_id_SYMB_1);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ExtensionContext extension() {
    dynamic _localctx = ExtensionContext(context, state);
    enterRule(_localctx, 10, RULE_extension);
    int _la;
    try {
      _localctx = AnExtensionContext(_localctx);
      enterOuterAlt(_localctx, 1);
      state = 62;
      match(TOKEN_Surrogate_id_SYMB_40);
      state = 63;
      match(TOKEN_Surrogate_id_SYMB_64);
      state = 64;
      _localctx._ExtensionName = match(TOKEN_ExtensionName);
      _localctx.extensionNames.add(_localctx._ExtensionName);
      state = 69;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_Surrogate_id_SYMB_0) {
        state = 65;
        match(TOKEN_Surrogate_id_SYMB_0);
        state = 66;
        _localctx._ExtensionName = match(TOKEN_ExtensionName);
        _localctx.extensionNames.add(_localctx._ExtensionName);
        state = 71;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 72;
      match(TOKEN_Surrogate_id_SYMB_1);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DeclarationContext declaration() {
    dynamic _localctx = DeclarationContext(context, state);
    enterRule(_localctx, 12, RULE_declaration);
    int _la;
    try {
      state = 190;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 18, context)) {
      case 1:
        _localctx = DeclFunContext(_localctx);
        enterOuterAlt(_localctx, 1);
        state = 77;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_48) {
          state = 74;
          _localctx._annotation = annotation();
          _localctx.annots.add(_localctx._annotation);
          state = 79;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 80;
        match(TOKEN_Surrogate_id_SYMB_43);
        state = 81;
        _localctx.name = match(TOKEN_StellaIdent);
        state = 82;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 91;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_StellaIdent) {
          state = 83;
          _localctx._paramDeclaration = paramDeclaration();
          _localctx.paramDecls.add(_localctx._paramDeclaration);
          state = 88;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 84;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 85;
            _localctx._paramDeclaration = paramDeclaration();
            _localctx.paramDecls.add(_localctx._paramDeclaration);
            state = 90;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 93;
        match(TOKEN_Surrogate_id_SYMB_3);
        state = 96;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Surrogate_id_SYMB_8) {
          state = 94;
          match(TOKEN_Surrogate_id_SYMB_8);
          state = 95;
          _localctx.returnType = stellatype(0);
        }

        state = 107;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Surrogate_id_SYMB_59) {
          state = 98;
          match(TOKEN_Surrogate_id_SYMB_59);
          state = 99;
          _localctx._stellatype = stellatype(0);
          _localctx.throwTypes.add(_localctx._stellatype);
          state = 104;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 100;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 101;
            _localctx._stellatype = stellatype(0);
            _localctx.throwTypes.add(_localctx._stellatype);
            state = 106;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 109;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 113;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 68728127521) != 0)) {
          state = 110;
          _localctx._declaration = declaration();
          _localctx.localDecls.add(_localctx._declaration);
          state = 115;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 116;
        match(TOKEN_Surrogate_id_SYMB_56);
        state = 117;
        _localctx.returnExpr = expression(0);
        state = 118;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 2:
        _localctx = DeclFunGenericContext(_localctx);
        enterOuterAlt(_localctx, 2);
        state = 123;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_48) {
          state = 120;
          _localctx._annotation = annotation();
          _localctx.annots.add(_localctx._annotation);
          state = 125;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 126;
        match(TOKEN_GENERIC);
        state = 127;
        match(TOKEN_Surrogate_id_SYMB_43);
        state = 128;
        _localctx.name = match(TOKEN_StellaIdent);
        state = 129;
        match(TOKEN_Surrogate_id_SYMB_13);
        state = 130;
        _localctx._StellaIdent = match(TOKEN_StellaIdent);
        _localctx.generics.add(_localctx._StellaIdent);
        state = 135;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_0) {
          state = 131;
          match(TOKEN_Surrogate_id_SYMB_0);
          state = 132;
          _localctx._StellaIdent = match(TOKEN_StellaIdent);
          _localctx.generics.add(_localctx._StellaIdent);
          state = 137;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 138;
        match(TOKEN_Surrogate_id_SYMB_14);
        state = 139;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 148;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_StellaIdent) {
          state = 140;
          _localctx._paramDeclaration = paramDeclaration();
          _localctx.paramDecls.add(_localctx._paramDeclaration);
          state = 145;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 141;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 142;
            _localctx._paramDeclaration = paramDeclaration();
            _localctx.paramDecls.add(_localctx._paramDeclaration);
            state = 147;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 150;
        match(TOKEN_Surrogate_id_SYMB_3);
        state = 153;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Surrogate_id_SYMB_8) {
          state = 151;
          match(TOKEN_Surrogate_id_SYMB_8);
          state = 152;
          _localctx.returnType = stellatype(0);
        }

        state = 164;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Surrogate_id_SYMB_59) {
          state = 155;
          match(TOKEN_Surrogate_id_SYMB_59);
          state = 156;
          _localctx._stellatype = stellatype(0);
          _localctx.throwTypes.add(_localctx._stellatype);
          state = 161;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 157;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 158;
            _localctx._stellatype = stellatype(0);
            _localctx.throwTypes.add(_localctx._stellatype);
            state = 163;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 166;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 170;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (((((_la - 44)) & ~0x3f) == 0 && ((1 << (_la - 44)) & 68728127521) != 0)) {
          state = 167;
          _localctx._declaration = declaration();
          _localctx.localDecls.add(_localctx._declaration);
          state = 172;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 173;
        match(TOKEN_Surrogate_id_SYMB_56);
        state = 174;
        _localctx.returnExpr = expression(0);
        state = 175;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 3:
        _localctx = DeclTypeAliasContext(_localctx);
        enterOuterAlt(_localctx, 3);
        state = 177;
        match(TOKEN_Surrogate_id_SYMB_61);
        state = 178;
        _localctx.name = match(TOKEN_StellaIdent);
        state = 179;
        match(TOKEN_Surrogate_id_SYMB_6);
        state = 180;
        _localctx.atype = stellatype(0);
        break;
      case 4:
        _localctx = DeclExceptionTypeContext(_localctx);
        enterOuterAlt(_localctx, 4);
        state = 181;
        match(TOKEN_EXCEPTION);
        state = 182;
        match(TOKEN_Surrogate_id_SYMB_61);
        state = 183;
        match(TOKEN_Surrogate_id_SYMB_6);
        state = 184;
        _localctx.exceptionType = stellatype(0);
        break;
      case 5:
        _localctx = DeclExceptionVariantContext(_localctx);
        enterOuterAlt(_localctx, 5);
        state = 185;
        match(TOKEN_EXCEPTION);
        state = 186;
        match(TOKEN_VARIANT);
        state = 187;
        _localctx.name = match(TOKEN_StellaIdent);
        state = 188;
        match(TOKEN_Surrogate_id_SYMB_7);
        state = 189;
        _localctx.variantType = stellatype(0);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AnnotationContext annotation() {
    dynamic _localctx = AnnotationContext(context, state);
    enterRule(_localctx, 14, RULE_annotation);
    try {
      _localctx = InlineAnnotationContext(_localctx);
      enterOuterAlt(_localctx, 1);
      state = 192;
      match(TOKEN_Surrogate_id_SYMB_48);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ParamDeclarationContext paramDeclaration() {
    dynamic _localctx = ParamDeclarationContext(context, state);
    enterRule(_localctx, 16, RULE_paramDeclaration);
    try {
      enterOuterAlt(_localctx, 1);
      state = 194;
      _localctx.name = match(TOKEN_StellaIdent);
      state = 195;
      match(TOKEN_Surrogate_id_SYMB_7);
      state = 196;
      _localctx.paramType = stellatype(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ExpressionContext expression([int _p = 0]) {
    final _parentctx = context;
    final _parentState = state;
    dynamic _localctx = ExpressionContext(context, _parentState);
    var _prevctx = _localctx;
    var _startState = 18;
    enterRecursionRule(_localctx, 18, RULE_expression, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 452;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 32, context)) {
      case 1:
        _localctx = ConstTrueContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;

        state = 199;
        match(TOKEN_Surrogate_id_SYMB_60);
        break;
      case 2:
        _localctx = ConstFalseContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 200;
        match(TOKEN_Surrogate_id_SYMB_41);
        break;
      case 3:
        _localctx = ConstUnitContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 201;
        match(TOKEN_Surrogate_id_SYMB_63);
        break;
      case 4:
        _localctx = ConstIntContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 202;
        _localctx.n = match(TOKEN_INTEGER);
        break;
      case 5:
        _localctx = ConstMemoryContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 203;
        _localctx.mem = match(TOKEN_MemoryAddress);
        break;
      case 6:
        _localctx = VarContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 204;
        _localctx.name = match(TOKEN_StellaIdent);
        break;
      case 7:
        _localctx = PanicContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 205;
        match(TOKEN_PANIC);
        break;
      case 8:
        _localctx = ThrowContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 206;
        match(TOKEN_THROW);
        state = 207;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 208;
        _localctx.expr_ = expression(0);
        state = 209;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 9:
        _localctx = TryCatchContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 211;
        match(TOKEN_TRY);
        state = 212;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 213;
        _localctx.tryExpr = expression(0);
        state = 214;
        match(TOKEN_Surrogate_id_SYMB_5);
        state = 215;
        match(TOKEN_CATCH);
        state = 216;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 217;
        _localctx.pat = pattern(0);
        state = 218;
        match(TOKEN_Surrogate_id_SYMB_9);
        state = 219;
        _localctx.fallbackExpr = expression(0);
        state = 220;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 10:
        _localctx = TryCastAsContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 222;
        match(TOKEN_TRY);
        state = 223;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 224;
        _localctx.tryExpr = expression(0);
        state = 225;
        match(TOKEN_Surrogate_id_SYMB_5);
        state = 226;
        match(TOKEN_CAST);
        state = 227;
        match(TOKEN_Surrogate_id_SYMB_36);
        state = 228;
        _localctx.type_ = stellatype(0);
        state = 229;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 230;
        _localctx.pattern_ = pattern(0);
        state = 231;
        match(TOKEN_Surrogate_id_SYMB_9);
        state = 232;
        _localctx.expr_ = expression(0);
        state = 233;
        match(TOKEN_Surrogate_id_SYMB_5);
        state = 234;
        match(TOKEN_Surrogate_id_SYMB_64);
        state = 235;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 236;
        _localctx.fallbackExpr = expression(0);
        state = 237;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 11:
        _localctx = TryWithContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 239;
        match(TOKEN_TRY);
        state = 240;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 241;
        _localctx.tryExpr = expression(0);
        state = 242;
        match(TOKEN_Surrogate_id_SYMB_5);
        state = 243;
        match(TOKEN_Surrogate_id_SYMB_64);
        state = 244;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 245;
        _localctx.fallbackExpr = expression(0);
        state = 246;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 12:
        _localctx = InlContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 248;
        match(TOKEN_Surrogate_id_SYMB_47);
        state = 249;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 250;
        _localctx.expr_ = expression(0);
        state = 251;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 13:
        _localctx = InrContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 253;
        match(TOKEN_Surrogate_id_SYMB_49);
        state = 254;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 255;
        _localctx.expr_ = expression(0);
        state = 256;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 14:
        _localctx = ConsListContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 258;
        match(TOKEN_Surrogate_id_SYMB_37);
        state = 259;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 260;
        _localctx.head = expression(0);
        state = 261;
        match(TOKEN_Surrogate_id_SYMB_0);
        state = 262;
        _localctx.tail = expression(0);
        state = 263;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 15:
        _localctx = HeadContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 265;
        match(TOKEN_Surrogate_id_SYMB_26);
        state = 266;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 267;
        _localctx.list = expression(0);
        state = 268;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 16:
        _localctx = IsEmptyContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 270;
        match(TOKEN_Surrogate_id_SYMB_27);
        state = 271;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 272;
        _localctx.list = expression(0);
        state = 273;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 17:
        _localctx = TailContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 275;
        match(TOKEN_Surrogate_id_SYMB_28);
        state = 276;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 277;
        _localctx.list = expression(0);
        state = 278;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 18:
        _localctx = SuccContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 280;
        match(TOKEN_Surrogate_id_SYMB_57);
        state = 281;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 282;
        _localctx.n = expression(0);
        state = 283;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 19:
        _localctx = LogicNotContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 285;
        match(TOKEN_Surrogate_id_SYMB_54);
        state = 286;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 287;
        _localctx.expr_ = expression(0);
        state = 288;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 20:
        _localctx = PredContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 290;
        match(TOKEN_Surrogate_id_SYMB_29);
        state = 291;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 292;
        _localctx.n = expression(0);
        state = 293;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 21:
        _localctx = IsZeroContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 295;
        match(TOKEN_Surrogate_id_SYMB_30);
        state = 296;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 297;
        _localctx.n = expression(0);
        state = 298;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 22:
        _localctx = FixContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 300;
        match(TOKEN_Surrogate_id_SYMB_42);
        state = 301;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 302;
        _localctx.expr_ = expression(0);
        state = 303;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 23:
        _localctx = NatRecContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 305;
        match(TOKEN_Surrogate_id_SYMB_31);
        state = 306;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 307;
        _localctx.n = expression(0);
        state = 308;
        match(TOKEN_Surrogate_id_SYMB_0);
        state = 309;
        _localctx.initial = expression(0);
        state = 310;
        match(TOKEN_Surrogate_id_SYMB_0);
        state = 311;
        _localctx.step = expression(0);
        state = 312;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 24:
        _localctx = FoldContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 314;
        match(TOKEN_Surrogate_id_SYMB_44);
        state = 315;
        match(TOKEN_Surrogate_id_SYMB_13);
        state = 316;
        _localctx.type_ = stellatype(0);
        state = 317;
        match(TOKEN_Surrogate_id_SYMB_14);
        state = 318;
        _localctx.expr_ = expression(34);
        break;
      case 25:
        _localctx = UnfoldContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 320;
        match(TOKEN_Surrogate_id_SYMB_62);
        state = 321;
        match(TOKEN_Surrogate_id_SYMB_13);
        state = 322;
        _localctx.type_ = stellatype(0);
        state = 323;
        match(TOKEN_Surrogate_id_SYMB_14);
        state = 324;
        _localctx.expr_ = expression(33);
        break;
      case 26:
        _localctx = RefContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 326;
        match(TOKEN_REFERENCE);
        state = 327;
        _localctx.expr_ = expression(27);
        break;
      case 27:
        _localctx = DerefContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 328;
        match(TOKEN_Surrogate_id_SYMB_23);
        state = 329;
        _localctx.expr_ = expression(26);
        break;
      case 28:
        _localctx = AbstractionContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 330;
        match(TOKEN_Surrogate_id_SYMB_43);
        state = 331;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 340;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_StellaIdent) {
          state = 332;
          _localctx._paramDeclaration = paramDeclaration();
          _localctx.paramDecls.add(_localctx._paramDeclaration);
          state = 337;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 333;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 334;
            _localctx._paramDeclaration = paramDeclaration();
            _localctx.paramDecls.add(_localctx._paramDeclaration);
            state = 339;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 342;
        match(TOKEN_Surrogate_id_SYMB_3);
        state = 343;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 344;
        match(TOKEN_Surrogate_id_SYMB_56);
        state = 345;
        _localctx.returnExpr = expression(0);
        state = 346;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 29:
        _localctx = TupleContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 348;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 357;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & -6560200659402993624) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1 << (_la - 64)) & 13700865) != 0)) {
          state = 349;
          _localctx._expression = expression(0);
          _localctx.exprs.add(_localctx._expression);
          state = 354;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 350;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 351;
            _localctx._expression = expression(0);
            _localctx.exprs.add(_localctx._expression);
            state = 356;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 359;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 30:
        _localctx = RecordContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 360;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 361;
        _localctx._binding = binding();
        _localctx.binds.add(_localctx._binding);
        state = 366;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_0) {
          state = 362;
          match(TOKEN_Surrogate_id_SYMB_0);
          state = 363;
          _localctx._binding = binding();
          _localctx.binds.add(_localctx._binding);
          state = 368;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 369;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 31:
        _localctx = VariantContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 371;
        match(TOKEN_Surrogate_id_SYMB_11);
        state = 372;
        _localctx.label = match(TOKEN_StellaIdent);
        state = 375;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Surrogate_id_SYMB_6) {
          state = 373;
          match(TOKEN_Surrogate_id_SYMB_6);
          state = 374;
          _localctx.rhs = expression(0);
        }

        state = 377;
        match(TOKEN_Surrogate_id_SYMB_12);
        break;
      case 32:
        _localctx = MatchContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 378;
        match(TOKEN_Surrogate_id_SYMB_53);
        state = 379;
        _localctx.expr_ = expression(0);
        state = 380;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 389;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2595485433173397544) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1 << (_la - 64)) & 9437185) != 0)) {
          state = 381;
          _localctx._matchCase = matchCase();
          _localctx.cases.add(_localctx._matchCase);
          state = 386;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_10) {
            state = 382;
            match(TOKEN_Surrogate_id_SYMB_10);
            state = 383;
            _localctx._matchCase = matchCase();
            _localctx.cases.add(_localctx._matchCase);
            state = 388;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 391;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 33:
        _localctx = ListContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 393;
        match(TOKEN_Surrogate_id_SYMB_13);
        state = 402;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & -6560200659402993624) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1 << (_la - 64)) & 13700865) != 0)) {
          state = 394;
          _localctx._expression = expression(0);
          _localctx.exprs.add(_localctx._expression);
          state = 399;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 395;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 396;
            _localctx._expression = expression(0);
            _localctx.exprs.add(_localctx._expression);
            state = 401;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 404;
        match(TOKEN_Surrogate_id_SYMB_14);
        break;
      case 34:
        _localctx = IfContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 405;
        match(TOKEN_Surrogate_id_SYMB_45);
        state = 406;
        _localctx.condition = expression(0);
        state = 407;
        match(TOKEN_Surrogate_id_SYMB_58);
        state = 408;
        _localctx.thenExpr = expression(0);
        state = 409;
        match(TOKEN_Surrogate_id_SYMB_39);
        state = 410;
        _localctx.elseExpr = expression(7);
        break;
      case 35:
        _localctx = LetContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 412;
        match(TOKEN_Surrogate_id_SYMB_51);
        state = 413;
        _localctx._patternBinding = patternBinding();
        _localctx.patternBinds.add(_localctx._patternBinding);
        state = 418;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_0) {
          state = 414;
          match(TOKEN_Surrogate_id_SYMB_0);
          state = 415;
          _localctx._patternBinding = patternBinding();
          _localctx.patternBinds.add(_localctx._patternBinding);
          state = 420;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 421;
        match(TOKEN_Surrogate_id_SYMB_46);
        state = 422;
        _localctx.body = expression(5);
        break;
      case 36:
        _localctx = LetRecContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 424;
        match(TOKEN_Surrogate_id_SYMB_52);
        state = 425;
        _localctx._patternBinding = patternBinding();
        _localctx.patternBinds.add(_localctx._patternBinding);
        state = 430;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_0) {
          state = 426;
          match(TOKEN_Surrogate_id_SYMB_0);
          state = 427;
          _localctx._patternBinding = patternBinding();
          _localctx.patternBinds.add(_localctx._patternBinding);
          state = 432;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 433;
        match(TOKEN_Surrogate_id_SYMB_46);
        state = 434;
        _localctx.body = expression(4);
        break;
      case 37:
        _localctx = TypeAbstractionContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 436;
        match(TOKEN_GENERIC);
        state = 437;
        match(TOKEN_Surrogate_id_SYMB_13);
        state = 438;
        _localctx._StellaIdent = match(TOKEN_StellaIdent);
        _localctx.generics.add(_localctx._StellaIdent);
        state = 443;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_0) {
          state = 439;
          match(TOKEN_Surrogate_id_SYMB_0);
          state = 440;
          _localctx._StellaIdent = match(TOKEN_StellaIdent);
          _localctx.generics.add(_localctx._StellaIdent);
          state = 445;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 446;
        match(TOKEN_Surrogate_id_SYMB_14);
        state = 447;
        _localctx.expr_ = expression(3);
        break;
      case 38:
        _localctx = ParenthesisedExprContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 448;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 449;
        _localctx.expr_ = expression(0);
        state = 450;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      }
      context!.stop = tokenStream.LT(-1);
      state = 538;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 37, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 536;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 36, context)) {
          case 1:
            _localctx = MultiplyContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 454;
            if (!(precpred(context, 30))) {
              throw FailedPredicateException(this, "precpred(context, 30)");
            }
            state = 455;
            match(TOKEN_Surrogate_id_SYMB_23);
            state = 456;
            _localctx.right = expression(31);
            break;
          case 2:
            _localctx = DivideContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 457;
            if (!(precpred(context, 29))) {
              throw FailedPredicateException(this, "precpred(context, 29)");
            }
            state = 458;
            match(TOKEN_Surrogate_id_SYMB_24);
            state = 459;
            _localctx.right = expression(30);
            break;
          case 3:
            _localctx = LogicAndContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 460;
            if (!(precpred(context, 28))) {
              throw FailedPredicateException(this, "precpred(context, 28)");
            }
            state = 461;
            match(TOKEN_Surrogate_id_SYMB_35);
            state = 462;
            _localctx.right = expression(29);
            break;
          case 4:
            _localctx = AddContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 463;
            if (!(precpred(context, 25))) {
              throw FailedPredicateException(this, "precpred(context, 25)");
            }
            state = 464;
            match(TOKEN_Surrogate_id_SYMB_21);
            state = 465;
            _localctx.right = expression(26);
            break;
          case 5:
            _localctx = SubtractContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 466;
            if (!(precpred(context, 24))) {
              throw FailedPredicateException(this, "precpred(context, 24)");
            }
            state = 467;
            match(TOKEN_Surrogate_id_SYMB_22);
            state = 468;
            _localctx.right = expression(25);
            break;
          case 6:
            _localctx = LogicOrContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 469;
            if (!(precpred(context, 23))) {
              throw FailedPredicateException(this, "precpred(context, 23)");
            }
            state = 470;
            match(TOKEN_Surrogate_id_SYMB_55);
            state = 471;
            _localctx.right = expression(24);
            break;
          case 7:
            _localctx = LessThanContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 472;
            if (!(precpred(context, 14))) {
              throw FailedPredicateException(this, "precpred(context, 14)");
            }
            state = 473;
            match(TOKEN_Surrogate_id_SYMB_15);
            state = 474;
            _localctx.right = expression(15);
            break;
          case 8:
            _localctx = LessThanOrEqualContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 475;
            if (!(precpred(context, 13))) {
              throw FailedPredicateException(this, "precpred(context, 13)");
            }
            state = 476;
            match(TOKEN_Surrogate_id_SYMB_16);
            state = 477;
            _localctx.right = expression(14);
            break;
          case 9:
            _localctx = GreaterThanContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 478;
            if (!(precpred(context, 12))) {
              throw FailedPredicateException(this, "precpred(context, 12)");
            }
            state = 479;
            match(TOKEN_Surrogate_id_SYMB_17);
            state = 480;
            _localctx.right = expression(13);
            break;
          case 10:
            _localctx = GreaterThanOrEqualContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 481;
            if (!(precpred(context, 11))) {
              throw FailedPredicateException(this, "precpred(context, 11)");
            }
            state = 482;
            match(TOKEN_Surrogate_id_SYMB_18);
            state = 483;
            _localctx.right = expression(12);
            break;
          case 11:
            _localctx = EqualContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 484;
            if (!(precpred(context, 10))) {
              throw FailedPredicateException(this, "precpred(context, 10)");
            }
            state = 485;
            match(TOKEN_Surrogate_id_SYMB_19);
            state = 486;
            _localctx.right = expression(11);
            break;
          case 12:
            _localctx = NotEqualContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 487;
            if (!(precpred(context, 9))) {
              throw FailedPredicateException(this, "precpred(context, 9)");
            }
            state = 488;
            match(TOKEN_Surrogate_id_SYMB_20);
            state = 489;
            _localctx.right = expression(10);
            break;
          case 13:
            _localctx = AssignContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.lhs = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 490;
            if (!(precpred(context, 8))) {
              throw FailedPredicateException(this, "precpred(context, 8)");
            }
            state = 491;
            match(TOKEN_ASSIGN);
            state = 492;
            _localctx.rhs = expression(9);
            break;
          case 14:
            _localctx = SequenceContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.expr1 = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 493;
            if (!(precpred(context, 6))) {
              throw FailedPredicateException(this, "precpred(context, 6)");
            }
            state = 494;
            match(TOKEN_Surrogate_id_SYMB_1);
            state = 495;
            _localctx.expr2 = expression(7);
            break;
          case 15:
            _localctx = DotRecordContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.expr_ = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 496;
            if (!(precpred(context, 59))) {
              throw FailedPredicateException(this, "precpred(context, 59)");
            }
            state = 497;
            match(TOKEN_Surrogate_id_SYMB_25);
            state = 498;
            _localctx.label = match(TOKEN_StellaIdent);
            break;
          case 16:
            _localctx = DotTupleContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.expr_ = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 499;
            if (!(precpred(context, 58))) {
              throw FailedPredicateException(this, "precpred(context, 58)");
            }
            state = 500;
            match(TOKEN_Surrogate_id_SYMB_25);
            state = 501;
            _localctx.index = match(TOKEN_INTEGER);
            break;
          case 17:
            _localctx = ApplicationContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.fun = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 502;
            if (!(precpred(context, 32))) {
              throw FailedPredicateException(this, "precpred(context, 32)");
            }
            state = 503;
            match(TOKEN_Surrogate_id_SYMB_2);
            state = 512;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
            if ((((_la) & ~0x3f) == 0 && ((1 << _la) & -6560200659402993624) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1 << (_la - 64)) & 13700865) != 0)) {
              state = 504;
              _localctx._expression = expression(0);
              _localctx.args.add(_localctx._expression);
              state = 509;
              errorHandler.sync(this);
              _la = tokenStream.LA(1)!;
              while (_la == TOKEN_Surrogate_id_SYMB_0) {
                state = 505;
                match(TOKEN_Surrogate_id_SYMB_0);
                state = 506;
                _localctx._expression = expression(0);
                _localctx.args.add(_localctx._expression);
                state = 511;
                errorHandler.sync(this);
                _la = tokenStream.LA(1)!;
              }
            }

            state = 514;
            match(TOKEN_Surrogate_id_SYMB_3);
            break;
          case 18:
            _localctx = TypeApplicationContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.fun = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 515;
            if (!(precpred(context, 31))) {
              throw FailedPredicateException(this, "precpred(context, 31)");
            }
            state = 516;
            match(TOKEN_Surrogate_id_SYMB_13);

            state = 517;
            _localctx._stellatype = stellatype(0);
            _localctx.types.add(_localctx._stellatype);
            state = 522;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
            while (_la == TOKEN_Surrogate_id_SYMB_0) {
              state = 518;
              match(TOKEN_Surrogate_id_SYMB_0);
              state = 519;
              _localctx._stellatype = stellatype(0);
              _localctx.types.add(_localctx._stellatype);
              state = 524;
              errorHandler.sync(this);
              _la = tokenStream.LA(1)!;
            }
            state = 525;
            match(TOKEN_Surrogate_id_SYMB_14);
            break;
          case 19:
            _localctx = TypeAscContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.expr_ = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 527;
            if (!(precpred(context, 22))) {
              throw FailedPredicateException(this, "precpred(context, 22)");
            }
            state = 528;
            match(TOKEN_Surrogate_id_SYMB_36);
            state = 529;
            _localctx.type_ = stellatype(0);
            break;
          case 20:
            _localctx = TypeCastContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.expr_ = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 530;
            if (!(precpred(context, 21))) {
              throw FailedPredicateException(this, "precpred(context, 21)");
            }
            state = 531;
            match(TOKEN_CAST);
            state = 532;
            match(TOKEN_Surrogate_id_SYMB_36);
            state = 533;
            _localctx.type_ = stellatype(0);
            break;
          case 21:
            _localctx = TerminatingSemicolonContext(new ExpressionContext(_parentctx, _parentState));
            _localctx.expr_ = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 534;
            if (!(precpred(context, 1))) {
              throw FailedPredicateException(this, "precpred(context, 1)");
            }
            state = 535;
            match(TOKEN_Surrogate_id_SYMB_1);
            break;
          } 
        }
        state = 540;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 37, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return _localctx;
  }

  PatternBindingContext patternBinding() {
    dynamic _localctx = PatternBindingContext(context, state);
    enterRule(_localctx, 20, RULE_patternBinding);
    try {
      enterOuterAlt(_localctx, 1);
      state = 541;
      _localctx.pat = pattern(0);
      state = 542;
      match(TOKEN_Surrogate_id_SYMB_6);
      state = 543;
      _localctx.rhs = expression(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BindingContext binding() {
    dynamic _localctx = BindingContext(context, state);
    enterRule(_localctx, 22, RULE_binding);
    try {
      enterOuterAlt(_localctx, 1);
      state = 545;
      _localctx.name = match(TOKEN_StellaIdent);
      state = 546;
      match(TOKEN_Surrogate_id_SYMB_6);
      state = 547;
      _localctx.rhs = expression(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MatchCaseContext matchCase() {
    dynamic _localctx = MatchCaseContext(context, state);
    enterRule(_localctx, 24, RULE_matchCase);
    try {
      enterOuterAlt(_localctx, 1);
      state = 549;
      _localctx.pattern_ = pattern(0);
      state = 550;
      match(TOKEN_Surrogate_id_SYMB_9);
      state = 551;
      _localctx.expr_ = expression(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PatternContext pattern([int _p = 0]) {
    final _parentctx = context;
    final _parentState = state;
    dynamic _localctx = PatternContext(context, _parentState);
    var _prevctx = _localctx;
    var _startState = 26;
    enterRecursionRule(_localctx, 26, RULE_pattern, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 628;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 45, context)) {
      case 1:
        _localctx = PatternVariantContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;

        state = 554;
        match(TOKEN_Surrogate_id_SYMB_11);
        state = 555;
        _localctx.label = match(TOKEN_StellaIdent);
        state = 558;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_Surrogate_id_SYMB_6) {
          state = 556;
          match(TOKEN_Surrogate_id_SYMB_6);
          state = 557;
          _localctx.pattern_ = pattern(0);
        }

        state = 560;
        match(TOKEN_Surrogate_id_SYMB_12);
        break;
      case 2:
        _localctx = PatternInlContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 561;
        match(TOKEN_Surrogate_id_SYMB_47);
        state = 562;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 563;
        _localctx.pattern_ = pattern(0);
        state = 564;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 3:
        _localctx = PatternInrContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 566;
        match(TOKEN_Surrogate_id_SYMB_49);
        state = 567;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 568;
        _localctx.pattern_ = pattern(0);
        state = 569;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 4:
        _localctx = PatternTupleContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 571;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 580;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2595485433173397544) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1 << (_la - 64)) & 9437185) != 0)) {
          state = 572;
          _localctx._pattern = pattern(0);
          _localctx.pttrs.add(_localctx._pattern);
          state = 577;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 573;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 574;
            _localctx._pattern = pattern(0);
            _localctx.pttrs.add(_localctx._pattern);
            state = 579;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 582;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 5:
        _localctx = PatternRecordContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 583;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 592;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_StellaIdent) {
          state = 584;
          _localctx._labelledPattern = labelledPattern();
          _localctx.pttrs.add(_localctx._labelledPattern);
          state = 589;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 585;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 586;
            _localctx._labelledPattern = labelledPattern();
            _localctx.pttrs.add(_localctx._labelledPattern);
            state = 591;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 594;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 6:
        _localctx = PatternListContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 595;
        match(TOKEN_Surrogate_id_SYMB_13);
        state = 604;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 2595485433173397544) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1 << (_la - 64)) & 9437185) != 0)) {
          state = 596;
          _localctx._pattern = pattern(0);
          _localctx.pttrs.add(_localctx._pattern);
          state = 601;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 597;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 598;
            _localctx._pattern = pattern(0);
            _localctx.pttrs.add(_localctx._pattern);
            state = 603;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 606;
        match(TOKEN_Surrogate_id_SYMB_14);
        break;
      case 7:
        _localctx = PatternConsContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 607;
        match(TOKEN_Surrogate_id_SYMB_37);
        state = 608;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 609;
        _localctx.head = pattern(0);
        state = 610;
        match(TOKEN_Surrogate_id_SYMB_0);
        state = 611;
        _localctx.tail = pattern(0);
        state = 612;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 8:
        _localctx = PatternFalseContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 614;
        match(TOKEN_Surrogate_id_SYMB_41);
        break;
      case 9:
        _localctx = PatternTrueContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 615;
        match(TOKEN_Surrogate_id_SYMB_60);
        break;
      case 10:
        _localctx = PatternUnitContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 616;
        match(TOKEN_Surrogate_id_SYMB_63);
        break;
      case 11:
        _localctx = PatternIntContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 617;
        _localctx.n = match(TOKEN_INTEGER);
        break;
      case 12:
        _localctx = PatternSuccContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 618;
        match(TOKEN_Surrogate_id_SYMB_57);
        state = 619;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 620;
        _localctx.pattern_ = pattern(0);
        state = 621;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      case 13:
        _localctx = PatternVarContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 623;
        _localctx.name = match(TOKEN_StellaIdent);
        break;
      case 14:
        _localctx = ParenthesisedPatternContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 624;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 625;
        _localctx.pattern_ = pattern(0);
        state = 626;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      }
      context!.stop = tokenStream.LT(-1);
      state = 639;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 47, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 637;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 46, context)) {
          case 1:
            _localctx = PatternAscContext(new PatternContext(_parentctx, _parentState));
            _localctx.pattern_ = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_pattern);
            state = 630;
            if (!(precpred(context, 3))) {
              throw FailedPredicateException(this, "precpred(context, 3)");
            }
            state = 631;
            match(TOKEN_Surrogate_id_SYMB_36);
            state = 632;
            _localctx.type_ = stellatype(0);
            break;
          case 2:
            _localctx = PatternCastAsContext(new PatternContext(_parentctx, _parentState));
            _localctx.pattern_ = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_pattern);
            state = 633;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 634;
            match(TOKEN_CAST);
            state = 635;
            match(TOKEN_Surrogate_id_SYMB_36);
            state = 636;
            _localctx.type_ = stellatype(0);
            break;
          } 
        }
        state = 641;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 47, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return _localctx;
  }

  LabelledPatternContext labelledPattern() {
    dynamic _localctx = LabelledPatternContext(context, state);
    enterRule(_localctx, 28, RULE_labelledPattern);
    try {
      enterOuterAlt(_localctx, 1);
      state = 642;
      _localctx.label = match(TOKEN_StellaIdent);
      state = 643;
      match(TOKEN_Surrogate_id_SYMB_6);
      state = 644;
      _localctx.pattern_ = pattern(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  StellatypeContext stellatype([int _p = 0]) {
    final _parentctx = context;
    final _parentState = state;
    dynamic _localctx = StellatypeContext(context, _parentState);
    var _prevctx = _localctx;
    var _startState = 30;
    enterRecursionRule(_localctx, 30, RULE_stellatype, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 727;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 56, context)) {
      case 1:
        _localctx = TypeBoolContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;

        state = 647;
        match(TOKEN_Surrogate_id_SYMB_32);
        break;
      case 2:
        _localctx = TypeNatContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 648;
        match(TOKEN_Surrogate_id_SYMB_33);
        break;
      case 3:
        _localctx = TypeRefContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 649;
        match(TOKEN_REF_TYPE);
        state = 650;
        _localctx.type_ = stellatype(15);
        break;
      case 4:
        _localctx = TypeFunContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 651;
        match(TOKEN_Surrogate_id_SYMB_43);
        state = 652;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 661;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 17652315607080) != 0) || ((((_la - 66)) & ~0x3f) == 0 && ((1 << (_la - 66)) & 309281) != 0)) {
          state = 653;
          _localctx._stellatype = stellatype(0);
          _localctx.paramTypes.add(_localctx._stellatype);
          state = 658;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 654;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 655;
            _localctx._stellatype = stellatype(0);
            _localctx.paramTypes.add(_localctx._stellatype);
            state = 660;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 663;
        match(TOKEN_Surrogate_id_SYMB_3);
        state = 664;
        match(TOKEN_Surrogate_id_SYMB_8);
        state = 665;
        _localctx.returnType = stellatype(13);
        break;
      case 5:
        _localctx = TypeForAllContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 666;
        match(TOKEN_FORALL);
        state = 670;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_StellaIdent) {
          state = 667;
          _localctx._StellaIdent = match(TOKEN_StellaIdent);
          _localctx.types.add(_localctx._StellaIdent);
          state = 672;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 673;
        match(TOKEN_Surrogate_id_SYMB_25);
        state = 674;
        _localctx.type_ = stellatype(12);
        break;
      case 6:
        _localctx = TypeRecContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 675;
        match(TOKEN_Surrogate_id_SYMB_65);
        state = 676;
        _localctx.var_ = match(TOKEN_StellaIdent);
        state = 677;
        match(TOKEN_Surrogate_id_SYMB_25);
        state = 678;
        _localctx.type_ = stellatype(11);
        break;
      case 7:
        _localctx = TypeTupleContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 679;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 688;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((1 << _la) & 17652315607080) != 0) || ((((_la - 66)) & ~0x3f) == 0 && ((1 << (_la - 66)) & 309281) != 0)) {
          state = 680;
          _localctx._stellatype = stellatype(0);
          _localctx.types.add(_localctx._stellatype);
          state = 685;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 681;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 682;
            _localctx._stellatype = stellatype(0);
            _localctx.types.add(_localctx._stellatype);
            state = 687;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 690;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 8:
        _localctx = TypeRecordContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 691;
        match(TOKEN_Surrogate_id_SYMB_4);
        state = 692;
        _localctx._recordFieldType = recordFieldType();
        _localctx.fieldTypes.add(_localctx._recordFieldType);
        state = 697;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        while (_la == TOKEN_Surrogate_id_SYMB_0) {
          state = 693;
          match(TOKEN_Surrogate_id_SYMB_0);
          state = 694;
          _localctx._recordFieldType = recordFieldType();
          _localctx.fieldTypes.add(_localctx._recordFieldType);
          state = 699;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
        }
        state = 700;
        match(TOKEN_Surrogate_id_SYMB_5);
        break;
      case 9:
        _localctx = TypeVariantContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 702;
        match(TOKEN_Surrogate_id_SYMB_11);
        state = 711;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_StellaIdent) {
          state = 703;
          _localctx._variantFieldType = variantFieldType();
          _localctx.fieldTypes.add(_localctx._variantFieldType);
          state = 708;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Surrogate_id_SYMB_0) {
            state = 704;
            match(TOKEN_Surrogate_id_SYMB_0);
            state = 705;
            _localctx._variantFieldType = variantFieldType();
            _localctx.fieldTypes.add(_localctx._variantFieldType);
            state = 710;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
        }

        state = 713;
        match(TOKEN_Surrogate_id_SYMB_12);
        break;
      case 10:
        _localctx = TypeListContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 714;
        match(TOKEN_Surrogate_id_SYMB_13);
        state = 715;
        _localctx.type_ = stellatype(0);
        state = 716;
        match(TOKEN_Surrogate_id_SYMB_14);
        break;
      case 11:
        _localctx = TypeUnitContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 718;
        match(TOKEN_Surrogate_id_SYMB_34);
        break;
      case 12:
        _localctx = TypeTopContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 719;
        match(TOKEN_TOP_TYPE);
        break;
      case 13:
        _localctx = TypeBottomContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 720;
        match(TOKEN_BOTTOM_TYPE);
        break;
      case 14:
        _localctx = TypeAutoContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 721;
        match(TOKEN_AUTO_TYPE);
        break;
      case 15:
        _localctx = TypeVarContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 722;
        _localctx.name = match(TOKEN_StellaIdent);
        break;
      case 16:
        _localctx = TypeParensContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 723;
        match(TOKEN_Surrogate_id_SYMB_2);
        state = 724;
        _localctx.type_ = stellatype(0);
        state = 725;
        match(TOKEN_Surrogate_id_SYMB_3);
        break;
      }
      context!.stop = tokenStream.LT(-1);
      state = 734;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 57, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          _localctx = TypeSumContext(new StellatypeContext(_parentctx, _parentState));
          _localctx.left = _prevctx;
          pushNewRecursionContext(_localctx, _startState, RULE_stellatype);
          state = 729;
          if (!(precpred(context, 14))) {
            throw FailedPredicateException(this, "precpred(context, 14)");
          }
          state = 730;
          match(TOKEN_Surrogate_id_SYMB_21);
          state = 731;
          _localctx.right = stellatype(15); 
        }
        state = 736;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 57, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return _localctx;
  }

  RecordFieldTypeContext recordFieldType() {
    dynamic _localctx = RecordFieldTypeContext(context, state);
    enterRule(_localctx, 32, RULE_recordFieldType);
    try {
      enterOuterAlt(_localctx, 1);
      state = 737;
      _localctx.label = match(TOKEN_StellaIdent);
      state = 738;
      match(TOKEN_Surrogate_id_SYMB_7);
      state = 739;
      _localctx.type_ = stellatype(0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  VariantFieldTypeContext variantFieldType() {
    dynamic _localctx = VariantFieldTypeContext(context, state);
    enterRule(_localctx, 34, RULE_variantFieldType);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 741;
      _localctx.label = match(TOKEN_StellaIdent);
      state = 744;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_Surrogate_id_SYMB_7) {
        state = 742;
        match(TOKEN_Surrogate_id_SYMB_7);
        state = 743;
        _localctx.type_ = stellatype(0);
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  @override
  bool sempred(RuleContext? _localctx, int ruleIndex, int predIndex) {
    switch (ruleIndex) {
    case 9:
      return _expression_sempred(_localctx as ExpressionContext?, predIndex);
    case 13:
      return _pattern_sempred(_localctx as PatternContext?, predIndex);
    case 15:
      return _stellatype_sempred(_localctx as StellatypeContext?, predIndex);
    }
    return true;
  }
  bool _expression_sempred(dynamic _localctx, int predIndex) {
    switch (predIndex) {
      case 0: return precpred(context, 30);
      case 1: return precpred(context, 29);
      case 2: return precpred(context, 28);
      case 3: return precpred(context, 25);
      case 4: return precpred(context, 24);
      case 5: return precpred(context, 23);
      case 6: return precpred(context, 14);
      case 7: return precpred(context, 13);
      case 8: return precpred(context, 12);
      case 9: return precpred(context, 11);
      case 10: return precpred(context, 10);
      case 11: return precpred(context, 9);
      case 12: return precpred(context, 8);
      case 13: return precpred(context, 6);
      case 14: return precpred(context, 59);
      case 15: return precpred(context, 58);
      case 16: return precpred(context, 32);
      case 17: return precpred(context, 31);
      case 18: return precpred(context, 22);
      case 19: return precpred(context, 21);
      case 20: return precpred(context, 1);
    }
    return true;
  }
  bool _pattern_sempred(dynamic _localctx, int predIndex) {
    switch (predIndex) {
      case 21: return precpred(context, 3);
      case 22: return precpred(context, 2);
    }
    return true;
  }
  bool _stellatype_sempred(dynamic _localctx, int predIndex) {
    switch (predIndex) {
      case 23: return precpred(context, 14);
    }
    return true;
  }

  static const List<int> _serializedATN = [
      4,1,89,747,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,1,0,1,0,1,0,1,1,1,1,1,1,1,2,
      1,2,1,2,1,3,1,3,5,3,48,8,3,10,3,12,3,51,9,3,1,3,5,3,54,8,3,10,3,12,
      3,57,9,3,1,4,1,4,1,4,1,4,1,5,1,5,1,5,1,5,1,5,5,5,68,8,5,10,5,12,5,
      71,9,5,1,5,1,5,1,6,5,6,76,8,6,10,6,12,6,79,9,6,1,6,1,6,1,6,1,6,1,6,
      1,6,5,6,87,8,6,10,6,12,6,90,9,6,3,6,92,8,6,1,6,1,6,1,6,3,6,97,8,6,
      1,6,1,6,1,6,1,6,5,6,103,8,6,10,6,12,6,106,9,6,3,6,108,8,6,1,6,1,6,
      5,6,112,8,6,10,6,12,6,115,9,6,1,6,1,6,1,6,1,6,1,6,5,6,122,8,6,10,6,
      12,6,125,9,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,5,6,134,8,6,10,6,12,6,137,
      9,6,1,6,1,6,1,6,1,6,1,6,5,6,144,8,6,10,6,12,6,147,9,6,3,6,149,8,6,
      1,6,1,6,1,6,3,6,154,8,6,1,6,1,6,1,6,1,6,5,6,160,8,6,10,6,12,6,163,
      9,6,3,6,165,8,6,1,6,1,6,5,6,169,8,6,10,6,12,6,172,9,6,1,6,1,6,1,6,
      1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,3,6,191,8,
      6,1,7,1,7,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,
      1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,
      9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,
      1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,
      9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,
      1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,
      9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,
      1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,
      9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,336,8,9,10,9,12,
      9,339,9,9,3,9,341,8,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,
      353,8,9,10,9,12,9,356,9,9,3,9,358,8,9,1,9,1,9,1,9,1,9,1,9,5,9,365,
      8,9,10,9,12,9,368,9,9,1,9,1,9,1,9,1,9,1,9,1,9,3,9,376,8,9,1,9,1,9,
      1,9,1,9,1,9,1,9,1,9,5,9,385,8,9,10,9,12,9,388,9,9,3,9,390,8,9,1,9,
      1,9,1,9,1,9,1,9,1,9,5,9,398,8,9,10,9,12,9,401,9,9,3,9,403,8,9,1,9,
      1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,417,8,9,10,9,12,9,
      420,9,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,429,8,9,10,9,12,9,432,9,9,
      1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,442,8,9,10,9,12,9,445,9,9,1,9,
      1,9,1,9,1,9,1,9,1,9,3,9,453,8,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,
      9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,
      1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,
      9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,508,8,9,10,9,12,
      9,511,9,9,3,9,513,8,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,521,8,9,10,9,12,
      9,524,9,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,537,8,9,
      10,9,12,9,540,9,9,1,10,1,10,1,10,1,10,1,11,1,11,1,11,1,11,1,12,1,12,
      1,12,1,12,1,13,1,13,1,13,1,13,1,13,3,13,559,8,13,1,13,1,13,1,13,1,
      13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,5,13,576,
      8,13,10,13,12,13,579,9,13,3,13,581,8,13,1,13,1,13,1,13,1,13,1,13,5,
      13,588,8,13,10,13,12,13,591,9,13,3,13,593,8,13,1,13,1,13,1,13,1,13,
      1,13,5,13,600,8,13,10,13,12,13,603,9,13,3,13,605,8,13,1,13,1,13,1,
      13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,
      1,13,1,13,1,13,1,13,1,13,1,13,3,13,629,8,13,1,13,1,13,1,13,1,13,1,
      13,1,13,1,13,5,13,638,8,13,10,13,12,13,641,9,13,1,14,1,14,1,14,1,14,
      1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,5,15,657,8,15,10,
      15,12,15,660,9,15,3,15,662,8,15,1,15,1,15,1,15,1,15,1,15,5,15,669,
      8,15,10,15,12,15,672,9,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
      1,15,1,15,5,15,684,8,15,10,15,12,15,687,9,15,3,15,689,8,15,1,15,1,
      15,1,15,1,15,1,15,5,15,696,8,15,10,15,12,15,699,9,15,1,15,1,15,1,15,
      1,15,1,15,1,15,5,15,707,8,15,10,15,12,15,710,9,15,3,15,712,8,15,1,
      15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
      3,15,728,8,15,1,15,1,15,1,15,5,15,733,8,15,10,15,12,15,736,9,15,1,
      16,1,16,1,16,1,16,1,17,1,17,1,17,3,17,745,8,17,1,17,0,3,18,26,30,18,
      0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,0,0,871,0,36,1,0,
      0,0,2,39,1,0,0,0,4,42,1,0,0,0,6,45,1,0,0,0,8,58,1,0,0,0,10,62,1,0,
      0,0,12,190,1,0,0,0,14,192,1,0,0,0,16,194,1,0,0,0,18,452,1,0,0,0,20,
      541,1,0,0,0,22,545,1,0,0,0,24,549,1,0,0,0,26,628,1,0,0,0,28,642,1,
      0,0,0,30,727,1,0,0,0,32,737,1,0,0,0,34,741,1,0,0,0,36,37,3,6,3,0,37,
      38,5,0,0,1,38,1,1,0,0,0,39,40,3,18,9,0,40,41,5,0,0,1,41,3,1,0,0,0,
      42,43,3,30,15,0,43,44,5,0,0,1,44,5,1,0,0,0,45,49,3,8,4,0,46,48,3,10,
      5,0,47,46,1,0,0,0,48,51,1,0,0,0,49,47,1,0,0,0,49,50,1,0,0,0,50,55,
      1,0,0,0,51,49,1,0,0,0,52,54,3,12,6,0,53,52,1,0,0,0,54,57,1,0,0,0,55,
      53,1,0,0,0,55,56,1,0,0,0,56,7,1,0,0,0,57,55,1,0,0,0,58,59,5,51,0,0,
      59,60,5,39,0,0,60,61,5,2,0,0,61,9,1,0,0,0,62,63,5,41,0,0,63,64,5,65,
      0,0,64,69,5,85,0,0,65,66,5,1,0,0,66,68,5,85,0,0,67,65,1,0,0,0,68,71,
      1,0,0,0,69,67,1,0,0,0,69,70,1,0,0,0,70,72,1,0,0,0,71,69,1,0,0,0,72,
      73,5,2,0,0,73,11,1,0,0,0,74,76,3,14,7,0,75,74,1,0,0,0,76,79,1,0,0,
      0,77,75,1,0,0,0,77,78,1,0,0,0,78,80,1,0,0,0,79,77,1,0,0,0,80,81,5,
      44,0,0,81,82,5,84,0,0,82,91,5,3,0,0,83,88,3,16,8,0,84,85,5,1,0,0,85,
      87,3,16,8,0,86,84,1,0,0,0,87,90,1,0,0,0,88,86,1,0,0,0,88,89,1,0,0,
      0,89,92,1,0,0,0,90,88,1,0,0,0,91,83,1,0,0,0,91,92,1,0,0,0,92,93,1,
      0,0,0,93,96,5,4,0,0,94,95,5,9,0,0,95,97,3,30,15,0,96,94,1,0,0,0,96,
      97,1,0,0,0,97,107,1,0,0,0,98,99,5,60,0,0,99,104,3,30,15,0,100,101,
      5,1,0,0,101,103,3,30,15,0,102,100,1,0,0,0,103,106,1,0,0,0,104,102,
      1,0,0,0,104,105,1,0,0,0,105,108,1,0,0,0,106,104,1,0,0,0,107,98,1,0,
      0,0,107,108,1,0,0,0,108,109,1,0,0,0,109,113,5,5,0,0,110,112,3,12,6,
      0,111,110,1,0,0,0,112,115,1,0,0,0,113,111,1,0,0,0,113,114,1,0,0,0,
      114,116,1,0,0,0,115,113,1,0,0,0,116,117,5,57,0,0,117,118,3,18,9,0,
      118,119,5,6,0,0,119,191,1,0,0,0,120,122,3,14,7,0,121,120,1,0,0,0,122,
      125,1,0,0,0,123,121,1,0,0,0,123,124,1,0,0,0,124,126,1,0,0,0,125,123,
      1,0,0,0,126,127,5,80,0,0,127,128,5,44,0,0,128,129,5,84,0,0,129,130,
      5,14,0,0,130,135,5,84,0,0,131,132,5,1,0,0,132,134,5,84,0,0,133,131,
      1,0,0,0,134,137,1,0,0,0,135,133,1,0,0,0,135,136,1,0,0,0,136,138,1,
      0,0,0,137,135,1,0,0,0,138,139,5,15,0,0,139,148,5,3,0,0,140,145,3,16,
      8,0,141,142,5,1,0,0,142,144,3,16,8,0,143,141,1,0,0,0,144,147,1,0,0,
      0,145,143,1,0,0,0,145,146,1,0,0,0,146,149,1,0,0,0,147,145,1,0,0,0,
      148,140,1,0,0,0,148,149,1,0,0,0,149,150,1,0,0,0,150,153,5,4,0,0,151,
      152,5,9,0,0,152,154,3,30,15,0,153,151,1,0,0,0,153,154,1,0,0,0,154,
      164,1,0,0,0,155,156,5,60,0,0,156,161,3,30,15,0,157,158,5,1,0,0,158,
      160,3,30,15,0,159,157,1,0,0,0,160,163,1,0,0,0,161,159,1,0,0,0,161,
      162,1,0,0,0,162,165,1,0,0,0,163,161,1,0,0,0,164,155,1,0,0,0,164,165,
      1,0,0,0,165,166,1,0,0,0,166,170,5,5,0,0,167,169,3,12,6,0,168,167,1,
      0,0,0,169,172,1,0,0,0,170,168,1,0,0,0,170,171,1,0,0,0,171,173,1,0,
      0,0,172,170,1,0,0,0,173,174,5,57,0,0,174,175,3,18,9,0,175,176,5,6,
      0,0,176,191,1,0,0,0,177,178,5,62,0,0,178,179,5,84,0,0,179,180,5,7,
      0,0,180,191,3,30,15,0,181,182,5,67,0,0,182,183,5,62,0,0,183,184,5,
      7,0,0,184,191,3,30,15,0,185,186,5,67,0,0,186,187,5,68,0,0,187,188,
      5,84,0,0,188,189,5,8,0,0,189,191,3,30,15,0,190,77,1,0,0,0,190,123,
      1,0,0,0,190,177,1,0,0,0,190,181,1,0,0,0,190,185,1,0,0,0,191,13,1,0,
      0,0,192,193,5,49,0,0,193,15,1,0,0,0,194,195,5,84,0,0,195,196,5,8,0,
      0,196,197,3,30,15,0,197,17,1,0,0,0,198,199,6,9,-1,0,199,453,5,61,0,
      0,200,453,5,42,0,0,201,453,5,64,0,0,202,453,5,87,0,0,203,453,5,86,
      0,0,204,453,5,84,0,0,205,453,5,73,0,0,206,207,5,74,0,0,207,208,5,3,
      0,0,208,209,3,18,9,0,209,210,5,4,0,0,210,453,1,0,0,0,211,212,5,75,
      0,0,212,213,5,5,0,0,213,214,3,18,9,0,214,215,5,6,0,0,215,216,5,76,
      0,0,216,217,5,5,0,0,217,218,3,26,13,0,218,219,5,10,0,0,219,220,3,18,
      9,0,220,221,5,6,0,0,221,453,1,0,0,0,222,223,5,75,0,0,223,224,5,5,0,
      0,224,225,3,18,9,0,225,226,5,6,0,0,226,227,5,69,0,0,227,228,5,37,0,
      0,228,229,3,30,15,0,229,230,5,5,0,0,230,231,3,26,13,0,231,232,5,10,
      0,0,232,233,3,18,9,0,233,234,5,6,0,0,234,235,5,65,0,0,235,236,5,5,
      0,0,236,237,3,18,9,0,237,238,5,6,0,0,238,453,1,0,0,0,239,240,5,75,
      0,0,240,241,5,5,0,0,241,242,3,18,9,0,242,243,5,6,0,0,243,244,5,65,
      0,0,244,245,5,5,0,0,245,246,3,18,9,0,246,247,5,6,0,0,247,453,1,0,0,
      0,248,249,5,48,0,0,249,250,5,3,0,0,250,251,3,18,9,0,251,252,5,4,0,
      0,252,453,1,0,0,0,253,254,5,50,0,0,254,255,5,3,0,0,255,256,3,18,9,
      0,256,257,5,4,0,0,257,453,1,0,0,0,258,259,5,38,0,0,259,260,5,3,0,0,
      260,261,3,18,9,0,261,262,5,1,0,0,262,263,3,18,9,0,263,264,5,4,0,0,
      264,453,1,0,0,0,265,266,5,27,0,0,266,267,5,3,0,0,267,268,3,18,9,0,
      268,269,5,4,0,0,269,453,1,0,0,0,270,271,5,28,0,0,271,272,5,3,0,0,272,
      273,3,18,9,0,273,274,5,4,0,0,274,453,1,0,0,0,275,276,5,29,0,0,276,
      277,5,3,0,0,277,278,3,18,9,0,278,279,5,4,0,0,279,453,1,0,0,0,280,281,
      5,58,0,0,281,282,5,3,0,0,282,283,3,18,9,0,283,284,5,4,0,0,284,453,
      1,0,0,0,285,286,5,55,0,0,286,287,5,3,0,0,287,288,3,18,9,0,288,289,
      5,4,0,0,289,453,1,0,0,0,290,291,5,30,0,0,291,292,5,3,0,0,292,293,3,
      18,9,0,293,294,5,4,0,0,294,453,1,0,0,0,295,296,5,31,0,0,296,297,5,
      3,0,0,297,298,3,18,9,0,298,299,5,4,0,0,299,453,1,0,0,0,300,301,5,43,
      0,0,301,302,5,3,0,0,302,303,3,18,9,0,303,304,5,4,0,0,304,453,1,0,0,
      0,305,306,5,32,0,0,306,307,5,3,0,0,307,308,3,18,9,0,308,309,5,1,0,
      0,309,310,3,18,9,0,310,311,5,1,0,0,311,312,3,18,9,0,312,313,5,4,0,
      0,313,453,1,0,0,0,314,315,5,45,0,0,315,316,5,14,0,0,316,317,3,30,15,
      0,317,318,5,15,0,0,318,319,3,18,9,34,319,453,1,0,0,0,320,321,5,63,
      0,0,321,322,5,14,0,0,322,323,3,30,15,0,323,324,5,15,0,0,324,325,3,
      18,9,33,325,453,1,0,0,0,326,327,5,72,0,0,327,453,3,18,9,27,328,329,
      5,24,0,0,329,453,3,18,9,26,330,331,5,44,0,0,331,340,5,3,0,0,332,337,
      3,16,8,0,333,334,5,1,0,0,334,336,3,16,8,0,335,333,1,0,0,0,336,339,
      1,0,0,0,337,335,1,0,0,0,337,338,1,0,0,0,338,341,1,0,0,0,339,337,1,
      0,0,0,340,332,1,0,0,0,340,341,1,0,0,0,341,342,1,0,0,0,342,343,5,4,
      0,0,343,344,5,5,0,0,344,345,5,57,0,0,345,346,3,18,9,0,346,347,5,6,
      0,0,347,453,1,0,0,0,348,357,5,5,0,0,349,354,3,18,9,0,350,351,5,1,0,
      0,351,353,3,18,9,0,352,350,1,0,0,0,353,356,1,0,0,0,354,352,1,0,0,0,
      354,355,1,0,0,0,355,358,1,0,0,0,356,354,1,0,0,0,357,349,1,0,0,0,357,
      358,1,0,0,0,358,359,1,0,0,0,359,453,5,6,0,0,360,361,5,5,0,0,361,366,
      3,22,11,0,362,363,5,1,0,0,363,365,3,22,11,0,364,362,1,0,0,0,365,368,
      1,0,0,0,366,364,1,0,0,0,366,367,1,0,0,0,367,369,1,0,0,0,368,366,1,
      0,0,0,369,370,5,6,0,0,370,453,1,0,0,0,371,372,5,12,0,0,372,375,5,84,
      0,0,373,374,5,7,0,0,374,376,3,18,9,0,375,373,1,0,0,0,375,376,1,0,0,
      0,376,377,1,0,0,0,377,453,5,13,0,0,378,379,5,54,0,0,379,380,3,18,9,
      0,380,389,5,5,0,0,381,386,3,24,12,0,382,383,5,11,0,0,383,385,3,24,
      12,0,384,382,1,0,0,0,385,388,1,0,0,0,386,384,1,0,0,0,386,387,1,0,0,
      0,387,390,1,0,0,0,388,386,1,0,0,0,389,381,1,0,0,0,389,390,1,0,0,0,
      390,391,1,0,0,0,391,392,5,6,0,0,392,453,1,0,0,0,393,402,5,14,0,0,394,
      399,3,18,9,0,395,396,5,1,0,0,396,398,3,18,9,0,397,395,1,0,0,0,398,
      401,1,0,0,0,399,397,1,0,0,0,399,400,1,0,0,0,400,403,1,0,0,0,401,399,
      1,0,0,0,402,394,1,0,0,0,402,403,1,0,0,0,403,404,1,0,0,0,404,453,5,
      15,0,0,405,406,5,46,0,0,406,407,3,18,9,0,407,408,5,59,0,0,408,409,
      3,18,9,0,409,410,5,40,0,0,410,411,3,18,9,7,411,453,1,0,0,0,412,413,
      5,52,0,0,413,418,3,20,10,0,414,415,5,1,0,0,415,417,3,20,10,0,416,414,
      1,0,0,0,417,420,1,0,0,0,418,416,1,0,0,0,418,419,1,0,0,0,419,421,1,
      0,0,0,420,418,1,0,0,0,421,422,5,47,0,0,422,423,3,18,9,5,423,453,1,
      0,0,0,424,425,5,53,0,0,425,430,3,20,10,0,426,427,5,1,0,0,427,429,3,
      20,10,0,428,426,1,0,0,0,429,432,1,0,0,0,430,428,1,0,0,0,430,431,1,
      0,0,0,431,433,1,0,0,0,432,430,1,0,0,0,433,434,5,47,0,0,434,435,3,18,
      9,4,435,453,1,0,0,0,436,437,5,80,0,0,437,438,5,14,0,0,438,443,5,84,
      0,0,439,440,5,1,0,0,440,442,5,84,0,0,441,439,1,0,0,0,442,445,1,0,0,
      0,443,441,1,0,0,0,443,444,1,0,0,0,444,446,1,0,0,0,445,443,1,0,0,0,
      446,447,5,15,0,0,447,453,3,18,9,3,448,449,5,3,0,0,449,450,3,18,9,0,
      450,451,5,4,0,0,451,453,1,0,0,0,452,198,1,0,0,0,452,200,1,0,0,0,452,
      201,1,0,0,0,452,202,1,0,0,0,452,203,1,0,0,0,452,204,1,0,0,0,452,205,
      1,0,0,0,452,206,1,0,0,0,452,211,1,0,0,0,452,222,1,0,0,0,452,239,1,
      0,0,0,452,248,1,0,0,0,452,253,1,0,0,0,452,258,1,0,0,0,452,265,1,0,
      0,0,452,270,1,0,0,0,452,275,1,0,0,0,452,280,1,0,0,0,452,285,1,0,0,
      0,452,290,1,0,0,0,452,295,1,0,0,0,452,300,1,0,0,0,452,305,1,0,0,0,
      452,314,1,0,0,0,452,320,1,0,0,0,452,326,1,0,0,0,452,328,1,0,0,0,452,
      330,1,0,0,0,452,348,1,0,0,0,452,360,1,0,0,0,452,371,1,0,0,0,452,378,
      1,0,0,0,452,393,1,0,0,0,452,405,1,0,0,0,452,412,1,0,0,0,452,424,1,
      0,0,0,452,436,1,0,0,0,452,448,1,0,0,0,453,538,1,0,0,0,454,455,10,30,
      0,0,455,456,5,24,0,0,456,537,3,18,9,31,457,458,10,29,0,0,458,459,5,
      25,0,0,459,537,3,18,9,30,460,461,10,28,0,0,461,462,5,36,0,0,462,537,
      3,18,9,29,463,464,10,25,0,0,464,465,5,22,0,0,465,537,3,18,9,26,466,
      467,10,24,0,0,467,468,5,23,0,0,468,537,3,18,9,25,469,470,10,23,0,0,
      470,471,5,56,0,0,471,537,3,18,9,24,472,473,10,14,0,0,473,474,5,16,
      0,0,474,537,3,18,9,15,475,476,10,13,0,0,476,477,5,17,0,0,477,537,3,
      18,9,14,478,479,10,12,0,0,479,480,5,18,0,0,480,537,3,18,9,13,481,482,
      10,11,0,0,482,483,5,19,0,0,483,537,3,18,9,12,484,485,10,10,0,0,485,
      486,5,20,0,0,486,537,3,18,9,11,487,488,10,9,0,0,488,489,5,21,0,0,489,
      537,3,18,9,10,490,491,10,8,0,0,491,492,5,70,0,0,492,537,3,18,9,9,493,
      494,10,6,0,0,494,495,5,2,0,0,495,537,3,18,9,7,496,497,10,59,0,0,497,
      498,5,26,0,0,498,537,5,84,0,0,499,500,10,58,0,0,500,501,5,26,0,0,501,
      537,5,87,0,0,502,503,10,32,0,0,503,512,5,3,0,0,504,509,3,18,9,0,505,
      506,5,1,0,0,506,508,3,18,9,0,507,505,1,0,0,0,508,511,1,0,0,0,509,507,
      1,0,0,0,509,510,1,0,0,0,510,513,1,0,0,0,511,509,1,0,0,0,512,504,1,
      0,0,0,512,513,1,0,0,0,513,514,1,0,0,0,514,537,5,4,0,0,515,516,10,31,
      0,0,516,517,5,14,0,0,517,522,3,30,15,0,518,519,5,1,0,0,519,521,3,30,
      15,0,520,518,1,0,0,0,521,524,1,0,0,0,522,520,1,0,0,0,522,523,1,0,0,
      0,523,525,1,0,0,0,524,522,1,0,0,0,525,526,5,15,0,0,526,537,1,0,0,0,
      527,528,10,22,0,0,528,529,5,37,0,0,529,537,3,30,15,0,530,531,10,21,
      0,0,531,532,5,69,0,0,532,533,5,37,0,0,533,537,3,30,15,0,534,535,10,
      1,0,0,535,537,5,2,0,0,536,454,1,0,0,0,536,457,1,0,0,0,536,460,1,0,
      0,0,536,463,1,0,0,0,536,466,1,0,0,0,536,469,1,0,0,0,536,472,1,0,0,
      0,536,475,1,0,0,0,536,478,1,0,0,0,536,481,1,0,0,0,536,484,1,0,0,0,
      536,487,1,0,0,0,536,490,1,0,0,0,536,493,1,0,0,0,536,496,1,0,0,0,536,
      499,1,0,0,0,536,502,1,0,0,0,536,515,1,0,0,0,536,527,1,0,0,0,536,530,
      1,0,0,0,536,534,1,0,0,0,537,540,1,0,0,0,538,536,1,0,0,0,538,539,1,
      0,0,0,539,19,1,0,0,0,540,538,1,0,0,0,541,542,3,26,13,0,542,543,5,7,
      0,0,543,544,3,18,9,0,544,21,1,0,0,0,545,546,5,84,0,0,546,547,5,7,0,
      0,547,548,3,18,9,0,548,23,1,0,0,0,549,550,3,26,13,0,550,551,5,10,0,
      0,551,552,3,18,9,0,552,25,1,0,0,0,553,554,6,13,-1,0,554,555,5,12,0,
      0,555,558,5,84,0,0,556,557,5,7,0,0,557,559,3,26,13,0,558,556,1,0,0,
      0,558,559,1,0,0,0,559,560,1,0,0,0,560,629,5,13,0,0,561,562,5,48,0,
      0,562,563,5,3,0,0,563,564,3,26,13,0,564,565,5,4,0,0,565,629,1,0,0,
      0,566,567,5,50,0,0,567,568,5,3,0,0,568,569,3,26,13,0,569,570,5,4,0,
      0,570,629,1,0,0,0,571,580,5,5,0,0,572,577,3,26,13,0,573,574,5,1,0,
      0,574,576,3,26,13,0,575,573,1,0,0,0,576,579,1,0,0,0,577,575,1,0,0,
      0,577,578,1,0,0,0,578,581,1,0,0,0,579,577,1,0,0,0,580,572,1,0,0,0,
      580,581,1,0,0,0,581,582,1,0,0,0,582,629,5,6,0,0,583,592,5,5,0,0,584,
      589,3,28,14,0,585,586,5,1,0,0,586,588,3,28,14,0,587,585,1,0,0,0,588,
      591,1,0,0,0,589,587,1,0,0,0,589,590,1,0,0,0,590,593,1,0,0,0,591,589,
      1,0,0,0,592,584,1,0,0,0,592,593,1,0,0,0,593,594,1,0,0,0,594,629,5,
      6,0,0,595,604,5,14,0,0,596,601,3,26,13,0,597,598,5,1,0,0,598,600,3,
      26,13,0,599,597,1,0,0,0,600,603,1,0,0,0,601,599,1,0,0,0,601,602,1,
      0,0,0,602,605,1,0,0,0,603,601,1,0,0,0,604,596,1,0,0,0,604,605,1,0,
      0,0,605,606,1,0,0,0,606,629,5,15,0,0,607,608,5,38,0,0,608,609,5,3,
      0,0,609,610,3,26,13,0,610,611,5,1,0,0,611,612,3,26,13,0,612,613,5,
      4,0,0,613,629,1,0,0,0,614,629,5,42,0,0,615,629,5,61,0,0,616,629,5,
      64,0,0,617,629,5,87,0,0,618,619,5,58,0,0,619,620,5,3,0,0,620,621,3,
      26,13,0,621,622,5,4,0,0,622,629,1,0,0,0,623,629,5,84,0,0,624,625,5,
      3,0,0,625,626,3,26,13,0,626,627,5,4,0,0,627,629,1,0,0,0,628,553,1,
      0,0,0,628,561,1,0,0,0,628,566,1,0,0,0,628,571,1,0,0,0,628,583,1,0,
      0,0,628,595,1,0,0,0,628,607,1,0,0,0,628,614,1,0,0,0,628,615,1,0,0,
      0,628,616,1,0,0,0,628,617,1,0,0,0,628,618,1,0,0,0,628,623,1,0,0,0,
      628,624,1,0,0,0,629,639,1,0,0,0,630,631,10,3,0,0,631,632,5,37,0,0,
      632,638,3,30,15,0,633,634,10,2,0,0,634,635,5,69,0,0,635,636,5,37,0,
      0,636,638,3,30,15,0,637,630,1,0,0,0,637,633,1,0,0,0,638,641,1,0,0,
      0,639,637,1,0,0,0,639,640,1,0,0,0,640,27,1,0,0,0,641,639,1,0,0,0,642,
      643,5,84,0,0,643,644,5,7,0,0,644,645,3,26,13,0,645,29,1,0,0,0,646,
      647,6,15,-1,0,647,728,5,33,0,0,648,728,5,34,0,0,649,650,5,71,0,0,650,
      728,3,30,15,15,651,652,5,44,0,0,652,661,5,3,0,0,653,658,3,30,15,0,
      654,655,5,1,0,0,655,657,3,30,15,0,656,654,1,0,0,0,657,660,1,0,0,0,
      658,656,1,0,0,0,658,659,1,0,0,0,659,662,1,0,0,0,660,658,1,0,0,0,661,
      653,1,0,0,0,661,662,1,0,0,0,662,663,1,0,0,0,663,664,5,4,0,0,664,665,
      5,9,0,0,665,728,3,30,15,13,666,670,5,81,0,0,667,669,5,84,0,0,668,667,
      1,0,0,0,669,672,1,0,0,0,670,668,1,0,0,0,670,671,1,0,0,0,671,673,1,
      0,0,0,672,670,1,0,0,0,673,674,5,26,0,0,674,728,3,30,15,12,675,676,
      5,66,0,0,676,677,5,84,0,0,677,678,5,26,0,0,678,728,3,30,15,11,679,
      688,5,5,0,0,680,685,3,30,15,0,681,682,5,1,0,0,682,684,3,30,15,0,683,
      681,1,0,0,0,684,687,1,0,0,0,685,683,1,0,0,0,685,686,1,0,0,0,686,689,
      1,0,0,0,687,685,1,0,0,0,688,680,1,0,0,0,688,689,1,0,0,0,689,690,1,
      0,0,0,690,728,5,6,0,0,691,692,5,5,0,0,692,697,3,32,16,0,693,694,5,
      1,0,0,694,696,3,32,16,0,695,693,1,0,0,0,696,699,1,0,0,0,697,695,1,
      0,0,0,697,698,1,0,0,0,698,700,1,0,0,0,699,697,1,0,0,0,700,701,5,6,
      0,0,701,728,1,0,0,0,702,711,5,12,0,0,703,708,3,34,17,0,704,705,5,1,
      0,0,705,707,3,34,17,0,706,704,1,0,0,0,707,710,1,0,0,0,708,706,1,0,
      0,0,708,709,1,0,0,0,709,712,1,0,0,0,710,708,1,0,0,0,711,703,1,0,0,
      0,711,712,1,0,0,0,712,713,1,0,0,0,713,728,5,13,0,0,714,715,5,14,0,
      0,715,716,3,30,15,0,716,717,5,15,0,0,717,728,1,0,0,0,718,728,5,35,
      0,0,719,728,5,77,0,0,720,728,5,78,0,0,721,728,5,79,0,0,722,728,5,84,
      0,0,723,724,5,3,0,0,724,725,3,30,15,0,725,726,5,4,0,0,726,728,1,0,
      0,0,727,646,1,0,0,0,727,648,1,0,0,0,727,649,1,0,0,0,727,651,1,0,0,
      0,727,666,1,0,0,0,727,675,1,0,0,0,727,679,1,0,0,0,727,691,1,0,0,0,
      727,702,1,0,0,0,727,714,1,0,0,0,727,718,1,0,0,0,727,719,1,0,0,0,727,
      720,1,0,0,0,727,721,1,0,0,0,727,722,1,0,0,0,727,723,1,0,0,0,728,734,
      1,0,0,0,729,730,10,14,0,0,730,731,5,22,0,0,731,733,3,30,15,15,732,
      729,1,0,0,0,733,736,1,0,0,0,734,732,1,0,0,0,734,735,1,0,0,0,735,31,
      1,0,0,0,736,734,1,0,0,0,737,738,5,84,0,0,738,739,5,8,0,0,739,740,3,
      30,15,0,740,33,1,0,0,0,741,744,5,84,0,0,742,743,5,8,0,0,743,745,3,
      30,15,0,744,742,1,0,0,0,744,745,1,0,0,0,745,35,1,0,0,0,59,49,55,69,
      77,88,91,96,104,107,113,123,135,145,148,153,161,164,170,190,337,340,
      354,357,366,375,386,389,399,402,418,430,443,452,509,512,522,536,538,
      558,577,580,589,592,601,604,628,637,639,658,661,670,685,688,697,708,
      711,727,734,744
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class Start_ProgramContext extends ParserRuleContext {
  ProgramContext? x;
  TerminalNode? EOF() => getToken(StellaParser.TOKEN_EOF, 0);
  ProgramContext? program() => getRuleContext<ProgramContext>(0);
  Start_ProgramContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_start_Program;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterStart_Program(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitStart_Program(this);
  }
}

class Start_ExprContext extends ParserRuleContext {
  ExpressionContext? x;
  TerminalNode? EOF() => getToken(StellaParser.TOKEN_EOF, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  Start_ExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_start_Expr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterStart_Expr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitStart_Expr(this);
  }
}

class Start_TypeContext extends ParserRuleContext {
  StellatypeContext? x;
  TerminalNode? EOF() => getToken(StellaParser.TOKEN_EOF, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  Start_TypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_start_Type;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterStart_Type(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitStart_Type(this);
  }
}

class ProgramContext extends ParserRuleContext {
  ExtensionContext? _extension;
  var exts = <ExtensionContext>[];
  DeclarationContext? _declaration;
  var decls = <DeclarationContext>[];
  LanguageDeclContext? languageDecl() => getRuleContext<LanguageDeclContext>(0);
  List<ExtensionContext> extensions() => getRuleContexts<ExtensionContext>();
  ExtensionContext? extension(int i) => getRuleContext<ExtensionContext>(i);
  List<DeclarationContext> declarations() => getRuleContexts<DeclarationContext>();
  DeclarationContext? declaration(int i) => getRuleContext<DeclarationContext>(i);
  ProgramContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_program;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterProgram(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitProgram(this);
  }
}

class LanguageDeclContext extends ParserRuleContext {
  LanguageDeclContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_languageDecl;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class ExtensionContext extends ParserRuleContext {
  ExtensionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_extension;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class DeclarationContext extends ParserRuleContext {
  DeclarationContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_declaration;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class AnnotationContext extends ParserRuleContext {
  AnnotationContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_annotation;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class ParamDeclarationContext extends ParserRuleContext {
  Token? name;
  StellatypeContext? paramType;
  TerminalNode? Surrogate_id_SYMB_7() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_7, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  ParamDeclarationContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_paramDeclaration;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterParamDeclaration(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitParamDeclaration(this);
  }
}

class ExpressionContext extends ParserRuleContext {
  ExpressionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_expression;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class PatternBindingContext extends ParserRuleContext {
  PatternContext? pat;
  ExpressionContext? rhs;
  TerminalNode? Surrogate_id_SYMB_6() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_6, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  PatternBindingContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_patternBinding;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternBinding(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternBinding(this);
  }
}

class BindingContext extends ParserRuleContext {
  Token? name;
  ExpressionContext? rhs;
  TerminalNode? Surrogate_id_SYMB_6() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_6, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  BindingContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_binding;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterBinding(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitBinding(this);
  }
}

class MatchCaseContext extends ParserRuleContext {
  PatternContext? pattern_;
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_9() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_9, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  MatchCaseContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_matchCase;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterMatchCase(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitMatchCase(this);
  }
}

class PatternContext extends ParserRuleContext {
  PatternContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_pattern;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class LabelledPatternContext extends ParserRuleContext {
  Token? label;
  PatternContext? pattern_;
  TerminalNode? Surrogate_id_SYMB_6() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_6, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  LabelledPatternContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_labelledPattern;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLabelledPattern(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLabelledPattern(this);
  }
}

class StellatypeContext extends ParserRuleContext {
  StellatypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_stellatype;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class RecordFieldTypeContext extends ParserRuleContext {
  Token? label;
  StellatypeContext? type_;
  TerminalNode? Surrogate_id_SYMB_7() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_7, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  RecordFieldTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_recordFieldType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterRecordFieldType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitRecordFieldType(this);
  }
}

class VariantFieldTypeContext extends ParserRuleContext {
  Token? label;
  StellatypeContext? type_;
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  TerminalNode? Surrogate_id_SYMB_7() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_7, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  VariantFieldTypeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_variantFieldType;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterVariantFieldType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitVariantFieldType(this);
  }
}

class LanguageCoreContext extends LanguageDeclContext {
  TerminalNode? Surrogate_id_SYMB_50() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_50, 0);
  TerminalNode? Surrogate_id_SYMB_38() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_38, 0);
  TerminalNode? Surrogate_id_SYMB_1() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_1, 0);
  LanguageCoreContext(LanguageDeclContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLanguageCore(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLanguageCore(this);
  }
}class AnExtensionContext extends ExtensionContext {
  Token? _ExtensionName;
  var extensionNames = <Token>[];
  TerminalNode? Surrogate_id_SYMB_40() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_40, 0);
  TerminalNode? Surrogate_id_SYMB_64() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_64, 0);
  TerminalNode? Surrogate_id_SYMB_1() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_1, 0);
  List<TerminalNode> ExtensionNames() => getTokens(StellaParser.TOKEN_ExtensionName);
  TerminalNode? ExtensionName(int i) => getToken(StellaParser.TOKEN_ExtensionName, i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  AnExtensionContext(ExtensionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterAnExtension(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitAnExtension(this);
  }
}class DeclTypeAliasContext extends DeclarationContext {
  Token? name;
  StellatypeContext? atype;
  TerminalNode? Surrogate_id_SYMB_61() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_61, 0);
  TerminalNode? Surrogate_id_SYMB_6() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_6, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  DeclTypeAliasContext(DeclarationContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDeclTypeAlias(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDeclTypeAlias(this);
  }
}

class DeclExceptionTypeContext extends DeclarationContext {
  StellatypeContext? exceptionType;
  TerminalNode? EXCEPTION() => getToken(StellaParser.TOKEN_EXCEPTION, 0);
  TerminalNode? Surrogate_id_SYMB_61() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_61, 0);
  TerminalNode? Surrogate_id_SYMB_6() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_6, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  DeclExceptionTypeContext(DeclarationContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDeclExceptionType(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDeclExceptionType(this);
  }
}

class DeclFunContext extends DeclarationContext {
  AnnotationContext? _annotation;
  var annots = <AnnotationContext>[];
  Token? name;
  ParamDeclarationContext? _paramDeclaration;
  var paramDecls = <ParamDeclarationContext>[];
  StellatypeContext? returnType;
  StellatypeContext? _stellatype;
  var throwTypes = <StellatypeContext>[];
  DeclarationContext? _declaration;
  var localDecls = <DeclarationContext>[];
  ExpressionContext? returnExpr;
  TerminalNode? Surrogate_id_SYMB_43() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_43, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_56() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_56, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  TerminalNode? Surrogate_id_SYMB_8() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_8, 0);
  TerminalNode? Surrogate_id_SYMB_59() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_59, 0);
  List<AnnotationContext> annotations() => getRuleContexts<AnnotationContext>();
  AnnotationContext? annotation(int i) => getRuleContext<AnnotationContext>(i);
  List<ParamDeclarationContext> paramDeclarations() => getRuleContexts<ParamDeclarationContext>();
  ParamDeclarationContext? paramDeclaration(int i) => getRuleContext<ParamDeclarationContext>(i);
  List<StellatypeContext> stellatypes() => getRuleContexts<StellatypeContext>();
  StellatypeContext? stellatype(int i) => getRuleContext<StellatypeContext>(i);
  List<DeclarationContext> declarations() => getRuleContexts<DeclarationContext>();
  DeclarationContext? declaration(int i) => getRuleContext<DeclarationContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  DeclFunContext(DeclarationContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDeclFun(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDeclFun(this);
  }
}

class DeclExceptionVariantContext extends DeclarationContext {
  Token? name;
  StellatypeContext? variantType;
  TerminalNode? EXCEPTION() => getToken(StellaParser.TOKEN_EXCEPTION, 0);
  TerminalNode? VARIANT() => getToken(StellaParser.TOKEN_VARIANT, 0);
  TerminalNode? Surrogate_id_SYMB_7() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_7, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  DeclExceptionVariantContext(DeclarationContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDeclExceptionVariant(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDeclExceptionVariant(this);
  }
}

class DeclFunGenericContext extends DeclarationContext {
  AnnotationContext? _annotation;
  var annots = <AnnotationContext>[];
  Token? name;
  Token? _StellaIdent;
  var generics = <Token>[];
  ParamDeclarationContext? _paramDeclaration;
  var paramDecls = <ParamDeclarationContext>[];
  StellatypeContext? returnType;
  StellatypeContext? _stellatype;
  var throwTypes = <StellatypeContext>[];
  DeclarationContext? _declaration;
  var localDecls = <DeclarationContext>[];
  ExpressionContext? returnExpr;
  TerminalNode? GENERIC() => getToken(StellaParser.TOKEN_GENERIC, 0);
  TerminalNode? Surrogate_id_SYMB_43() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_43, 0);
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_56() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_56, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  List<TerminalNode> StellaIdents() => getTokens(StellaParser.TOKEN_StellaIdent);
  TerminalNode? StellaIdent(int i) => getToken(StellaParser.TOKEN_StellaIdent, i);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TerminalNode? Surrogate_id_SYMB_8() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_8, 0);
  TerminalNode? Surrogate_id_SYMB_59() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_59, 0);
  List<AnnotationContext> annotations() => getRuleContexts<AnnotationContext>();
  AnnotationContext? annotation(int i) => getRuleContext<AnnotationContext>(i);
  List<ParamDeclarationContext> paramDeclarations() => getRuleContexts<ParamDeclarationContext>();
  ParamDeclarationContext? paramDeclaration(int i) => getRuleContext<ParamDeclarationContext>(i);
  List<StellatypeContext> stellatypes() => getRuleContexts<StellatypeContext>();
  StellatypeContext? stellatype(int i) => getRuleContext<StellatypeContext>(i);
  List<DeclarationContext> declarations() => getRuleContexts<DeclarationContext>();
  DeclarationContext? declaration(int i) => getRuleContext<DeclarationContext>(i);
  DeclFunGenericContext(DeclarationContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDeclFunGeneric(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDeclFunGeneric(this);
  }
}class InlineAnnotationContext extends AnnotationContext {
  TerminalNode? Surrogate_id_SYMB_48() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_48, 0);
  InlineAnnotationContext(AnnotationContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterInlineAnnotation(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitInlineAnnotation(this);
  }
}class FoldContext extends ExpressionContext {
  StellatypeContext? type_;
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_44() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_44, 0);
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  FoldContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterFold(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitFold(this);
  }
}

class AddContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_21() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_21, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  AddContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterAdd(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitAdd(this);
  }
}

class IsZeroContext extends ExpressionContext {
  ExpressionContext? n;
  TerminalNode? Surrogate_id_SYMB_30() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_30, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  IsZeroContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterIsZero(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitIsZero(this);
  }
}

class VarContext extends ExpressionContext {
  Token? name;
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  VarContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterVar(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitVar(this);
  }
}

class TypeAbstractionContext extends ExpressionContext {
  Token? _StellaIdent;
  var generics = <Token>[];
  ExpressionContext? expr_;
  TerminalNode? GENERIC() => getToken(StellaParser.TOKEN_GENERIC, 0);
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  List<TerminalNode> StellaIdents() => getTokens(StellaParser.TOKEN_StellaIdent);
  TerminalNode? StellaIdent(int i) => getToken(StellaParser.TOKEN_StellaIdent, i);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TypeAbstractionContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeAbstraction(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeAbstraction(this);
  }
}

class DivideContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_24() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_24, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  DivideContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDivide(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDivide(this);
  }
}

class LessThanContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_15() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_15, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  LessThanContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLessThan(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLessThan(this);
  }
}

class DotRecordContext extends ExpressionContext {
  ExpressionContext? expr_;
  Token? label;
  TerminalNode? Surrogate_id_SYMB_25() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_25, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  DotRecordContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDotRecord(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDotRecord(this);
  }
}

class GreaterThanContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_17() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_17, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  GreaterThanContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterGreaterThan(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitGreaterThan(this);
  }
}

class EqualContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_19() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_19, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  EqualContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterEqual(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitEqual(this);
  }
}

class ThrowContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? THROW() => getToken(StellaParser.TOKEN_THROW, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  ThrowContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterThrow(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitThrow(this);
  }
}

class MultiplyContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_23() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_23, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  MultiplyContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterMultiply(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitMultiply(this);
  }
}

class ConstMemoryContext extends ExpressionContext {
  Token? mem;
  TerminalNode? MemoryAddress() => getToken(StellaParser.TOKEN_MemoryAddress, 0);
  ConstMemoryContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterConstMemory(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitConstMemory(this);
  }
}

class ListContext extends ExpressionContext {
  ExpressionContext? _expression;
  var exprs = <ExpressionContext>[];
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  ListContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterList(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitList(this);
  }
}

class TryCatchContext extends ExpressionContext {
  ExpressionContext? tryExpr;
  PatternContext? pat;
  ExpressionContext? fallbackExpr;
  TerminalNode? TRY() => getToken(StellaParser.TOKEN_TRY, 0);
  List<TerminalNode> Surrogate_id_SYMB_4s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_4);
  TerminalNode? Surrogate_id_SYMB_4(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, i);
  List<TerminalNode> Surrogate_id_SYMB_5s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_5);
  TerminalNode? Surrogate_id_SYMB_5(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, i);
  TerminalNode? CATCH() => getToken(StellaParser.TOKEN_CATCH, 0);
  TerminalNode? Surrogate_id_SYMB_9() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_9, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  TryCatchContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTryCatch(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTryCatch(this);
  }
}

class TryCastAsContext extends ExpressionContext {
  ExpressionContext? tryExpr;
  StellatypeContext? type_;
  PatternContext? pattern_;
  ExpressionContext? expr_;
  ExpressionContext? fallbackExpr;
  TerminalNode? TRY() => getToken(StellaParser.TOKEN_TRY, 0);
  List<TerminalNode> Surrogate_id_SYMB_4s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_4);
  TerminalNode? Surrogate_id_SYMB_4(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, i);
  List<TerminalNode> Surrogate_id_SYMB_5s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_5);
  TerminalNode? Surrogate_id_SYMB_5(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, i);
  TerminalNode? CAST() => getToken(StellaParser.TOKEN_CAST, 0);
  TerminalNode? Surrogate_id_SYMB_36() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_36, 0);
  TerminalNode? Surrogate_id_SYMB_9() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_9, 0);
  TerminalNode? Surrogate_id_SYMB_64() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_64, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  TryCastAsContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTryCastAs(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTryCastAs(this);
  }
}

class HeadContext extends ExpressionContext {
  ExpressionContext? list;
  TerminalNode? Surrogate_id_SYMB_26() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_26, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  HeadContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterHead(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitHead(this);
  }
}

class TerminatingSemicolonContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_1() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_1, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  TerminatingSemicolonContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTerminatingSemicolon(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTerminatingSemicolon(this);
  }
}

class NotEqualContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_20() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_20, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  NotEqualContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterNotEqual(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitNotEqual(this);
  }
}

class ConstUnitContext extends ExpressionContext {
  TerminalNode? Surrogate_id_SYMB_63() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_63, 0);
  ConstUnitContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterConstUnit(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitConstUnit(this);
  }
}

class SequenceContext extends ExpressionContext {
  ExpressionContext? expr1;
  ExpressionContext? expr2;
  TerminalNode? Surrogate_id_SYMB_1() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_1, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  SequenceContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterSequence(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitSequence(this);
  }
}

class ConstFalseContext extends ExpressionContext {
  TerminalNode? Surrogate_id_SYMB_41() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_41, 0);
  ConstFalseContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterConstFalse(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitConstFalse(this);
  }
}

class AbstractionContext extends ExpressionContext {
  ParamDeclarationContext? _paramDeclaration;
  var paramDecls = <ParamDeclarationContext>[];
  ExpressionContext? returnExpr;
  TerminalNode? Surrogate_id_SYMB_43() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_43, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_56() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_56, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  List<ParamDeclarationContext> paramDeclarations() => getRuleContexts<ParamDeclarationContext>();
  ParamDeclarationContext? paramDeclaration(int i) => getRuleContext<ParamDeclarationContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  AbstractionContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterAbstraction(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitAbstraction(this);
  }
}

class ConstIntContext extends ExpressionContext {
  Token? n;
  TerminalNode? INTEGER() => getToken(StellaParser.TOKEN_INTEGER, 0);
  ConstIntContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterConstInt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitConstInt(this);
  }
}

class VariantContext extends ExpressionContext {
  Token? label;
  ExpressionContext? rhs;
  TerminalNode? Surrogate_id_SYMB_11() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_11, 0);
  TerminalNode? Surrogate_id_SYMB_12() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_12, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  TerminalNode? Surrogate_id_SYMB_6() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_6, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  VariantContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterVariant(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitVariant(this);
  }
}

class ConstTrueContext extends ExpressionContext {
  TerminalNode? Surrogate_id_SYMB_60() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_60, 0);
  ConstTrueContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterConstTrue(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitConstTrue(this);
  }
}

class SubtractContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_22() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_22, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  SubtractContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterSubtract(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitSubtract(this);
  }
}

class TypeCastContext extends ExpressionContext {
  ExpressionContext? expr_;
  StellatypeContext? type_;
  TerminalNode? CAST() => getToken(StellaParser.TOKEN_CAST, 0);
  TerminalNode? Surrogate_id_SYMB_36() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_36, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  TypeCastContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeCast(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeCast(this);
  }
}

class IfContext extends ExpressionContext {
  ExpressionContext? condition;
  ExpressionContext? thenExpr;
  ExpressionContext? elseExpr;
  TerminalNode? Surrogate_id_SYMB_45() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_45, 0);
  TerminalNode? Surrogate_id_SYMB_58() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_58, 0);
  TerminalNode? Surrogate_id_SYMB_39() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_39, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  IfContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterIf(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitIf(this);
  }
}

class ApplicationContext extends ExpressionContext {
  ExpressionContext? fun;
  ExpressionContext? _expression;
  var args = <ExpressionContext>[];
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  ApplicationContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterApplication(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitApplication(this);
  }
}

class DerefContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_23() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_23, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  DerefContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDeref(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDeref(this);
  }
}

class IsEmptyContext extends ExpressionContext {
  ExpressionContext? list;
  TerminalNode? Surrogate_id_SYMB_27() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_27, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  IsEmptyContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterIsEmpty(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitIsEmpty(this);
  }
}

class PanicContext extends ExpressionContext {
  TerminalNode? PANIC() => getToken(StellaParser.TOKEN_PANIC, 0);
  PanicContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPanic(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPanic(this);
  }
}

class LessThanOrEqualContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_16() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_16, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  LessThanOrEqualContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLessThanOrEqual(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLessThanOrEqual(this);
  }
}

class SuccContext extends ExpressionContext {
  ExpressionContext? n;
  TerminalNode? Surrogate_id_SYMB_57() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_57, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  SuccContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterSucc(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitSucc(this);
  }
}

class InlContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_47() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_47, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  InlContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterInl(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitInl(this);
  }
}

class GreaterThanOrEqualContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_18() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_18, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  GreaterThanOrEqualContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterGreaterThanOrEqual(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitGreaterThanOrEqual(this);
  }
}

class InrContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_49() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_49, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  InrContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterInr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitInr(this);
  }
}

class MatchContext extends ExpressionContext {
  ExpressionContext? expr_;
  MatchCaseContext? _matchCase;
  var cases = <MatchCaseContext>[];
  TerminalNode? Surrogate_id_SYMB_53() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_53, 0);
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  List<MatchCaseContext> matchCases() => getRuleContexts<MatchCaseContext>();
  MatchCaseContext? matchCase(int i) => getRuleContext<MatchCaseContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_10s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_10);
  TerminalNode? Surrogate_id_SYMB_10(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_10, i);
  MatchContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterMatch(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitMatch(this);
  }
}

class LogicNotContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_54() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_54, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  LogicNotContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLogicNot(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLogicNot(this);
  }
}

class ParenthesisedExprContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  ParenthesisedExprContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterParenthesisedExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitParenthesisedExpr(this);
  }
}

class TailContext extends ExpressionContext {
  ExpressionContext? list;
  TerminalNode? Surrogate_id_SYMB_28() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_28, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  TailContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTail(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTail(this);
  }
}

class RecordContext extends ExpressionContext {
  BindingContext? _binding;
  var binds = <BindingContext>[];
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  List<BindingContext> bindings() => getRuleContexts<BindingContext>();
  BindingContext? binding(int i) => getRuleContext<BindingContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  RecordContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterRecord(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitRecord(this);
  }
}

class LogicAndContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_35() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_35, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  LogicAndContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLogicAnd(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLogicAnd(this);
  }
}

class TypeApplicationContext extends ExpressionContext {
  ExpressionContext? fun;
  StellatypeContext? _stellatype;
  var types = <StellatypeContext>[];
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  List<StellatypeContext> stellatypes() => getRuleContexts<StellatypeContext>();
  StellatypeContext? stellatype(int i) => getRuleContext<StellatypeContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TypeApplicationContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeApplication(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeApplication(this);
  }
}

class LetRecContext extends ExpressionContext {
  PatternBindingContext? _patternBinding;
  var patternBinds = <PatternBindingContext>[];
  ExpressionContext? body;
  TerminalNode? Surrogate_id_SYMB_52() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_52, 0);
  TerminalNode? Surrogate_id_SYMB_46() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_46, 0);
  List<PatternBindingContext> patternBindings() => getRuleContexts<PatternBindingContext>();
  PatternBindingContext? patternBinding(int i) => getRuleContext<PatternBindingContext>(i);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  LetRecContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLetRec(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLetRec(this);
  }
}

class LogicOrContext extends ExpressionContext {
  ExpressionContext? left;
  ExpressionContext? right;
  TerminalNode? Surrogate_id_SYMB_55() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_55, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  LogicOrContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLogicOr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLogicOr(this);
  }
}

class TryWithContext extends ExpressionContext {
  ExpressionContext? tryExpr;
  ExpressionContext? fallbackExpr;
  TerminalNode? TRY() => getToken(StellaParser.TOKEN_TRY, 0);
  List<TerminalNode> Surrogate_id_SYMB_4s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_4);
  TerminalNode? Surrogate_id_SYMB_4(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, i);
  List<TerminalNode> Surrogate_id_SYMB_5s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_5);
  TerminalNode? Surrogate_id_SYMB_5(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, i);
  TerminalNode? Surrogate_id_SYMB_64() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_64, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  TryWithContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTryWith(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTryWith(this);
  }
}

class PredContext extends ExpressionContext {
  ExpressionContext? n;
  TerminalNode? Surrogate_id_SYMB_29() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_29, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  PredContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPred(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPred(this);
  }
}

class TypeAscContext extends ExpressionContext {
  ExpressionContext? expr_;
  StellatypeContext? type_;
  TerminalNode? Surrogate_id_SYMB_36() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_36, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  TypeAscContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeAsc(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeAsc(this);
  }
}

class NatRecContext extends ExpressionContext {
  ExpressionContext? n;
  ExpressionContext? initial;
  ExpressionContext? step;
  TerminalNode? Surrogate_id_SYMB_31() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_31, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  NatRecContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterNatRec(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitNatRec(this);
  }
}

class UnfoldContext extends ExpressionContext {
  StellatypeContext? type_;
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_62() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_62, 0);
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  UnfoldContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterUnfold(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitUnfold(this);
  }
}

class RefContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? REFERENCE() => getToken(StellaParser.TOKEN_REFERENCE, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  RefContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterRef(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitRef(this);
  }
}

class DotTupleContext extends ExpressionContext {
  ExpressionContext? expr_;
  Token? index;
  TerminalNode? Surrogate_id_SYMB_25() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_25, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  TerminalNode? INTEGER() => getToken(StellaParser.TOKEN_INTEGER, 0);
  DotTupleContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterDotTuple(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitDotTuple(this);
  }
}

class FixContext extends ExpressionContext {
  ExpressionContext? expr_;
  TerminalNode? Surrogate_id_SYMB_42() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_42, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  FixContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterFix(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitFix(this);
  }
}

class LetContext extends ExpressionContext {
  PatternBindingContext? _patternBinding;
  var patternBinds = <PatternBindingContext>[];
  ExpressionContext? body;
  TerminalNode? Surrogate_id_SYMB_51() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_51, 0);
  TerminalNode? Surrogate_id_SYMB_46() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_46, 0);
  List<PatternBindingContext> patternBindings() => getRuleContexts<PatternBindingContext>();
  PatternBindingContext? patternBinding(int i) => getRuleContext<PatternBindingContext>(i);
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  LetContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterLet(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitLet(this);
  }
}

class AssignContext extends ExpressionContext {
  ExpressionContext? lhs;
  ExpressionContext? rhs;
  TerminalNode? ASSIGN() => getToken(StellaParser.TOKEN_ASSIGN, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  AssignContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterAssign(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitAssign(this);
  }
}

class TupleContext extends ExpressionContext {
  ExpressionContext? _expression;
  var exprs = <ExpressionContext>[];
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TupleContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTuple(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTuple(this);
  }
}

class ConsListContext extends ExpressionContext {
  ExpressionContext? head;
  ExpressionContext? tail;
  TerminalNode? Surrogate_id_SYMB_37() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_37, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_0() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  ConsListContext(ExpressionContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterConsList(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitConsList(this);
  }
}class PatternConsContext extends PatternContext {
  PatternContext? head;
  PatternContext? tail;
  TerminalNode? Surrogate_id_SYMB_37() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_37, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_0() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  List<PatternContext> patterns() => getRuleContexts<PatternContext>();
  PatternContext? pattern(int i) => getRuleContext<PatternContext>(i);
  PatternConsContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternCons(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternCons(this);
  }
}

class PatternTupleContext extends PatternContext {
  PatternContext? _pattern;
  var pttrs = <PatternContext>[];
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  List<PatternContext> patterns() => getRuleContexts<PatternContext>();
  PatternContext? pattern(int i) => getRuleContext<PatternContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  PatternTupleContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternTuple(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternTuple(this);
  }
}

class PatternListContext extends PatternContext {
  PatternContext? _pattern;
  var pttrs = <PatternContext>[];
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  List<PatternContext> patterns() => getRuleContexts<PatternContext>();
  PatternContext? pattern(int i) => getRuleContext<PatternContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  PatternListContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternList(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternList(this);
  }
}

class PatternRecordContext extends PatternContext {
  LabelledPatternContext? _labelledPattern;
  var pttrs = <LabelledPatternContext>[];
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  List<LabelledPatternContext> labelledPatterns() => getRuleContexts<LabelledPatternContext>();
  LabelledPatternContext? labelledPattern(int i) => getRuleContext<LabelledPatternContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  PatternRecordContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternRecord(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternRecord(this);
  }
}

class PatternVariantContext extends PatternContext {
  Token? label;
  PatternContext? pattern_;
  TerminalNode? Surrogate_id_SYMB_11() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_11, 0);
  TerminalNode? Surrogate_id_SYMB_12() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_12, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  TerminalNode? Surrogate_id_SYMB_6() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_6, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  PatternVariantContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternVariant(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternVariant(this);
  }
}

class PatternAscContext extends PatternContext {
  PatternContext? pattern_;
  StellatypeContext? type_;
  TerminalNode? Surrogate_id_SYMB_36() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_36, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  PatternAscContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternAsc(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternAsc(this);
  }
}

class PatternIntContext extends PatternContext {
  Token? n;
  TerminalNode? INTEGER() => getToken(StellaParser.TOKEN_INTEGER, 0);
  PatternIntContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternInt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternInt(this);
  }
}

class PatternInrContext extends PatternContext {
  PatternContext? pattern_;
  TerminalNode? Surrogate_id_SYMB_49() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_49, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  PatternInrContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternInr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternInr(this);
  }
}

class PatternTrueContext extends PatternContext {
  TerminalNode? Surrogate_id_SYMB_60() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_60, 0);
  PatternTrueContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternTrue(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternTrue(this);
  }
}

class PatternInlContext extends PatternContext {
  PatternContext? pattern_;
  TerminalNode? Surrogate_id_SYMB_47() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_47, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  PatternInlContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternInl(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternInl(this);
  }
}

class PatternVarContext extends PatternContext {
  Token? name;
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  PatternVarContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternVar(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternVar(this);
  }
}

class ParenthesisedPatternContext extends PatternContext {
  PatternContext? pattern_;
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  ParenthesisedPatternContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterParenthesisedPattern(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitParenthesisedPattern(this);
  }
}

class PatternSuccContext extends PatternContext {
  PatternContext? pattern_;
  TerminalNode? Surrogate_id_SYMB_57() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_57, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  PatternSuccContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternSucc(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternSucc(this);
  }
}

class PatternFalseContext extends PatternContext {
  TerminalNode? Surrogate_id_SYMB_41() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_41, 0);
  PatternFalseContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternFalse(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternFalse(this);
  }
}

class PatternUnitContext extends PatternContext {
  TerminalNode? Surrogate_id_SYMB_63() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_63, 0);
  PatternUnitContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternUnit(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternUnit(this);
  }
}

class PatternCastAsContext extends PatternContext {
  PatternContext? pattern_;
  StellatypeContext? type_;
  TerminalNode? CAST() => getToken(StellaParser.TOKEN_CAST, 0);
  TerminalNode? Surrogate_id_SYMB_36() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_36, 0);
  PatternContext? pattern() => getRuleContext<PatternContext>(0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  PatternCastAsContext(PatternContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterPatternCastAs(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitPatternCastAs(this);
  }
}class TypeTupleContext extends StellatypeContext {
  StellatypeContext? _stellatype;
  var types = <StellatypeContext>[];
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  List<StellatypeContext> stellatypes() => getRuleContexts<StellatypeContext>();
  StellatypeContext? stellatype(int i) => getRuleContext<StellatypeContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TypeTupleContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeTuple(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeTuple(this);
  }
}

class TypeTopContext extends StellatypeContext {
  TerminalNode? TOP_TYPE() => getToken(StellaParser.TOKEN_TOP_TYPE, 0);
  TypeTopContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeTop(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeTop(this);
  }
}

class TypeBoolContext extends StellatypeContext {
  TerminalNode? Surrogate_id_SYMB_32() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_32, 0);
  TypeBoolContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeBool(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeBool(this);
  }
}

class TypeRefContext extends StellatypeContext {
  StellatypeContext? type_;
  TerminalNode? REF_TYPE() => getToken(StellaParser.TOKEN_REF_TYPE, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  TypeRefContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeRef(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeRef(this);
  }
}

class TypeRecContext extends StellatypeContext {
  Token? var_;
  StellatypeContext? type_;
  TerminalNode? Surrogate_id_SYMB_65() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_65, 0);
  TerminalNode? Surrogate_id_SYMB_25() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_25, 0);
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  TypeRecContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeRec(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeRec(this);
  }
}

class TypeAutoContext extends StellatypeContext {
  TerminalNode? AUTO_TYPE() => getToken(StellaParser.TOKEN_AUTO_TYPE, 0);
  TypeAutoContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeAuto(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeAuto(this);
  }
}

class TypeSumContext extends StellatypeContext {
  StellatypeContext? left;
  StellatypeContext? right;
  TerminalNode? Surrogate_id_SYMB_21() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_21, 0);
  List<StellatypeContext> stellatypes() => getRuleContexts<StellatypeContext>();
  StellatypeContext? stellatype(int i) => getRuleContext<StellatypeContext>(i);
  TypeSumContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeSum(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeSum(this);
  }
}

class TypeVarContext extends StellatypeContext {
  Token? name;
  TerminalNode? StellaIdent() => getToken(StellaParser.TOKEN_StellaIdent, 0);
  TypeVarContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeVar(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeVar(this);
  }
}

class TypeVariantContext extends StellatypeContext {
  VariantFieldTypeContext? _variantFieldType;
  var fieldTypes = <VariantFieldTypeContext>[];
  TerminalNode? Surrogate_id_SYMB_11() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_11, 0);
  TerminalNode? Surrogate_id_SYMB_12() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_12, 0);
  List<VariantFieldTypeContext> variantFieldTypes() => getRuleContexts<VariantFieldTypeContext>();
  VariantFieldTypeContext? variantFieldType(int i) => getRuleContext<VariantFieldTypeContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TypeVariantContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeVariant(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeVariant(this);
  }
}

class TypeUnitContext extends StellatypeContext {
  TerminalNode? Surrogate_id_SYMB_34() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_34, 0);
  TypeUnitContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeUnit(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeUnit(this);
  }
}

class TypeNatContext extends StellatypeContext {
  TerminalNode? Surrogate_id_SYMB_33() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_33, 0);
  TypeNatContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeNat(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeNat(this);
  }
}

class TypeBottomContext extends StellatypeContext {
  TerminalNode? BOTTOM_TYPE() => getToken(StellaParser.TOKEN_BOTTOM_TYPE, 0);
  TypeBottomContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeBottom(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeBottom(this);
  }
}

class TypeParensContext extends StellatypeContext {
  StellatypeContext? type_;
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  TypeParensContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeParens(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeParens(this);
  }
}

class TypeFunContext extends StellatypeContext {
  StellatypeContext? _stellatype;
  var paramTypes = <StellatypeContext>[];
  StellatypeContext? returnType;
  TerminalNode? Surrogate_id_SYMB_43() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_43, 0);
  TerminalNode? Surrogate_id_SYMB_2() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_2, 0);
  TerminalNode? Surrogate_id_SYMB_3() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_3, 0);
  TerminalNode? Surrogate_id_SYMB_8() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_8, 0);
  List<StellatypeContext> stellatypes() => getRuleContexts<StellatypeContext>();
  StellatypeContext? stellatype(int i) => getRuleContext<StellatypeContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TypeFunContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeFun(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeFun(this);
  }
}

class TypeForAllContext extends StellatypeContext {
  Token? _StellaIdent;
  var types = <Token>[];
  StellatypeContext? type_;
  TerminalNode? FORALL() => getToken(StellaParser.TOKEN_FORALL, 0);
  TerminalNode? Surrogate_id_SYMB_25() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_25, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  List<TerminalNode> StellaIdents() => getTokens(StellaParser.TOKEN_StellaIdent);
  TerminalNode? StellaIdent(int i) => getToken(StellaParser.TOKEN_StellaIdent, i);
  TypeForAllContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeForAll(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeForAll(this);
  }
}

class TypeRecordContext extends StellatypeContext {
  RecordFieldTypeContext? _recordFieldType;
  var fieldTypes = <RecordFieldTypeContext>[];
  TerminalNode? Surrogate_id_SYMB_4() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_4, 0);
  TerminalNode? Surrogate_id_SYMB_5() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_5, 0);
  List<RecordFieldTypeContext> recordFieldTypes() => getRuleContexts<RecordFieldTypeContext>();
  RecordFieldTypeContext? recordFieldType(int i) => getRuleContext<RecordFieldTypeContext>(i);
  List<TerminalNode> Surrogate_id_SYMB_0s() => getTokens(StellaParser.TOKEN_Surrogate_id_SYMB_0);
  TerminalNode? Surrogate_id_SYMB_0(int i) => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_0, i);
  TypeRecordContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeRecord(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeRecord(this);
  }
}

class TypeListContext extends StellatypeContext {
  StellatypeContext? type_;
  TerminalNode? Surrogate_id_SYMB_13() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_13, 0);
  TerminalNode? Surrogate_id_SYMB_14() => getToken(StellaParser.TOKEN_Surrogate_id_SYMB_14, 0);
  StellatypeContext? stellatype() => getRuleContext<StellatypeContext>(0);
  TypeListContext(StellatypeContext ctx) { copyFrom(ctx); }
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.enterTypeList(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is StellaParserListener) listener.exitTypeList(this);
  }
}