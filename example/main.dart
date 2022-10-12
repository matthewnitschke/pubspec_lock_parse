import 'dart:io';

import 'package:pubspec_lock_parse/pubspec_lock_parse.dart';

void main() {
  final lockStr = File('./example_pubspec.lock').readAsStringSync();
  final lockfile = PubspecLock.parse(lockStr);

  print('Dependencies found in lockfile:');
  for (final packageName in lockfile.packages.keys) {
    print(
        '  $packageName: ${lockfile.packages[packageName]!.version.toString()}');
  }
}
