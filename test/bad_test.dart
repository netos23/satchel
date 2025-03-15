import 'dart:io';

import 'package:antlr4/antlr4.dart';
import 'package:satchel/satchel.dart';
import 'package:test/test.dart';

import 'util.dart';

void main() {
  group('Bad tests', () {
    final root = Directory.current.path;
    final basePath = '$root/test/stella-tests/bad';
    final dir = Directory(basePath);

    setUpAll(() {
      ensureInitialized();
    });

    for (final badTestGroup in dir.listSync()) {
      final expectErrorCode = badTestGroup.asTestName(1);
      group(expectErrorCode, () {
        for (final file in Directory.fromUri(badTestGroup.uri).listSync()) {
          final testName = file.asTestName();
          test(testName, () async {
            final input = await InputStream.fromPath(file.absolute.path);
            final report = buildStellaTypeReport(input);

            switch (report) {
              case ErrorTypeReport(:final errorCode):
                expect(expectErrorCode, errorCode.code);
              default:
                fail('Expect error report');
            }
          });
        }
      });
    }
  });
}
