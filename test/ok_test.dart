import 'dart:io';

import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';
import 'package:test/test.dart';

void main(List<String> args) {
  final basePath = args[0];
  final dir = Directory(basePath);

  group('Ok tests', () async {
    setUpAll(() {
      ensureInitialized();
    });

    await for (final file in dir.list()) {
      test(file.path, () async {
        final input = await InputStream.fromPath(file.absolute.path);
        final report = buildStellaTypeReport(input);
        
        expect(report, isA<GotTypeReport>());
      });
    }
  });
}
