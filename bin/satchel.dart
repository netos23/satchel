import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';

Future<void> main(List<String> args) async {
  StellaLexer.checkVersion();
  StellaParser.checkVersion();

  final input = await InputStream.fromPath(args[0]);
  final lexer = StellaLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = StellaParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());


}
