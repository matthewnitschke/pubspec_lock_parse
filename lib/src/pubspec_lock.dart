import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pubspec_lock_parse/src/package.dart';
import 'package:pub_semver/pub_semver.dart';

part 'pubspec_lock.g.dart';

@JsonSerializable()
class PubspecLock {
  @JsonKey(fromJson: parsePackages)
  final Map<String, Package> packages;

  @JsonKey(fromJson: _parseSdks)
  final Map<String, VersionConstraint> sdks;

  PubspecLock({
    required this.packages,
    required this.sdks,
  });

  factory PubspecLock.fromJson(Map json) => _$PubspecLockFromJson(json);

  factory PubspecLock.parse(String yaml, {Uri? sourceUrl}) =>
      checkedYamlDecode(yaml, (map) => PubspecLock.fromJson(map ?? {}),
          sourceUrl: sourceUrl);
}

// ---------------------------------- Parsers ----------------------------------

Map<String, VersionConstraint> _parseSdks(Map source) => source
    .map((k, v) => MapEntry(k, _versionConstraintFromString(v as String)));

VersionConstraint _versionConstraintFromString(String input) =>
    VersionConstraint.parse(input);
