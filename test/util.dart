import 'dart:io';

extension FileToTestNameX on FileSystemEntity {
  String asTestName([int offset = 0]) {
    return uri.pathSegments.reversed.skip(offset).first;
  }
}
