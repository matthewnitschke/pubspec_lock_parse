import 'dart:io';

import 'package:pubspec_lock_parse/pubspec_lock_parse.dart';

void main() {
  // read the pubspec lock of this package (might require calling pub get to generate)
  final lockStr = File('../pubspec.lock').readAsStringSync();
  final lockfile = PubspecLock.parse(lockStr);

  print('Dependencies found in lockfile:');
  for (final packageName in lockfile.packages.keys) {
    print(
        '  $packageName: ${lockfile.packages[packageName]!.version.toString()}');
  }
}
