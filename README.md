[![Dart](https://github.com/matthewnitschke/pubspec_lock_parse/actions/workflows/dart.yml/badge.svg)](https://github.com/matthewnitschke/pubspec_lock_parse/actions/workflows/dart.yml)
[![pub package](https://img.shields.io/pub/v/pubspec_lock_parse.svg)](https://pub.dev/packages/pubspec_lock_parse)

Supports parsing `pubspec.lock` files with robust error reporting

Designed around the [`pubspec_parse`](https://github.com/dart-lang/pubspec_parse) package, and mirrors its implementation and interface

## Usage

```dart
import 'dart:io';
import 'package:pubspec_lock_parse/pubspec_lock_parse.dart';

void main() {
    final lockStr = File('path/to/pubspec.lock').readAsStringSync();
    final lockfile = PubspecLock.parse(lockStr)
}
```

You can find more about the `PubspecLock` object in the documentation [here](https://pub.dev/documentation/pubspec_lock_parse/latest/)