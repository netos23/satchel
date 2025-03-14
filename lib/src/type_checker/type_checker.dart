import 'package:antlr4/antlr4.dart';
import 'package:satchel/src/type_checker/visitor/stella_type_visitor.dart';
import 'package:satchel/src/type_checker/visitor/top_level_function_visitor.dart';

import '../antlr/StellaLexer.dart';
import '../antlr/StellaParser.dart';
import 'model/stella_type_report.dart';

StellaTypeReport? buildStellaTypeReport(InputStream input) {
  final lexer = StellaLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = StellaParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());

  final root = parser.start_Program();
  final context = root.accept(TopLevelFunctionVisitor())!;

  return root.accept(StellaTypeVisitor(context));
}
