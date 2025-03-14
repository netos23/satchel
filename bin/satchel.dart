import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';
import 'package:satchel/src/type_checker/type_checker.dart';

Future<void> main(List<String> args) async {


  final input = await InputStream.fromPath(args[0]);
  final report = buildStellaTypeReport(input);

  print(report.toString());
}
