import 'dart:convert';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pubspec_lock_parse/pubspec_lock_parse.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:test/test.dart';

const defaultPubspecLock = {
  'packages': {},
  'sdks': {'dart': '>=2.7.0 <3.0.0'},
};

Map<String, Object> hostedPackage({
  required String name,
  String dependency = 'transitive',
  required String url,
  required String version,
}) => _package(
    name: name,
    dependency: dependency,
    packageDescription: {
      'name': name,
      'url': url
    },
    source: 'hosted',
    version: version
  );

Map<String, Object> gitPackage({
  required String name,
  String dependency = 'transitive',
  required String path,
  required String ref,
  required String resolvedRef,
  required String url,
  required String version,
}) => _package(
    name: name,
    dependency: dependency,
    packageDescription: {
      'path': path,
      'ref': ref,
      'resolved-ref': resolvedRef,
      'url': url
    },
    source: 'git',
    version: version
  );

Map<String, Object> pathPackage({
  required String name,
  String dependency = 'direct',
  required String path,
  required bool isRelative,
  required String version,
}) => _package(
    name: name,
    dependency: dependency,
    packageDescription: {
      'path': path,
      'relative': isRelative,
    },
    source: 'path',
    version: version
  );

Map<String, Object> _package({
  required String name,
  String dependency = 'transitive',
  required Map<String, Object> packageDescription,
  required String source,
  required String version,
}) {
  return {
     name: {
      'dependency': dependency,
      'description': packageDescription,
      'source': source,
      'version': version
    }
  };
}

PubspecLock parse(
  Object content, {
  bool quietOnError = false,
  bool skipTryPub = false,
  bool lenient = false,
}) {
  final encoded = _encodeJson(content);

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