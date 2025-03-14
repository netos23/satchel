import 'dart:io';

import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';
import 'package:test/test.dart';

import 'util.dart';

void main() {
  group('Ok tests', () {
    const basePath = './test/stella-tests/ok';
    final dir = Directory(basePath);

    setUpAll(() {
      ensureInitialized();
    });

    for (final file in dir.listSync()) {
      final testName = file.asTestName();
      test(testName, () async {
        final input = await InputStream.fromPath(file.absolute.path);
        final report = buildStellaTypeReport(input);

        expect(report, isA<GotTypeReport>());
      });
    }
  });
}
