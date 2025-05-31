import 'dart:io';

import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';

Future<void> main(List<String> args) async {
  final input = await InputStream.fromPath(args[0]);
  final report = buildStellaTypeReport(input);

  switch (report) {
    case GotTypeReport():
      print(report);
    case ErrorTypeReport():
      stderr.write(report);
      exit(1);
    default:
      stderr.write(report);
      exit(1);
  }
}
