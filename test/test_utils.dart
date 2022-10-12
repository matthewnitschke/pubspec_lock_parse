import 'dart:convert';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pubspec_lock_parse/pubspec_lock_parse.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

PubspecLock parse(
  String pubspecLockYaml, {
  bool quietOnError = false,
  bool skipTryPub = false,
  bool lenient = false,
}) {
  final encoded = _encodeJson(loadYaml(pubspecLockYaml));

  try {
    final value = PubspecLock.parse(encoded);

    return value;
  } catch (e) {
    if (e is ParsedYamlException) {
      if (!quietOnError) {
        _printDebugParsedYamlException(e);
      }
    }
    rethrow;
  }
}

String _encodeJson(Object input) =>
    const JsonEncoder.withIndent(' ').convert(input);

void _printDebugParsedYamlException(ParsedYamlException e) {
  var innerError = e.innerError;
  StackTrace? innerStack;

  if (innerError is CheckedFromJsonException) {
    final cfje = innerError;

    if (cfje.innerError != null) {
      innerError = cfje.innerError;
      innerStack = cfje.innerStack;
    }
  }

  if (innerError != null) {
    final items = [innerError];
    if (innerStack != null) {
      items.add(Trace.format(innerStack));
    }

    final content =
        LineSplitter.split(items.join('\n')).map((e) => '  $e').join('\n');

    printOnFailure('Inner error details:\n$content');
  }
}
