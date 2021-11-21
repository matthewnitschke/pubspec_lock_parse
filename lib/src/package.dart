import 'package:json_annotation/json_annotation.dart';
import 'package:pubspec_lock_parse/src/package_description.dart';
import 'package:pub_semver/pub_semver.dart';

part 'package.g.dart';

Map<String, Package> parsePackages(Map source) =>
  source.map((k, v) {
    final value = v as Map;
    return MapEntry(k, Package.fromJson(value));
  });

@JsonSerializable()
class Package {
  final String dependency;

  @JsonKey(fromJson: parsePackageDescription)
  final PackageDescription description;

  final PackageSource source;

  @JsonKey(fromJson: _versionFromString)
  final Version version;

  Package({
    required this.dependency,
    required this.description,
    required this.source,
    required this.version,
  });

  factory Package.fromJson(Map json) => _$PackageFromJson(json);
}

enum PackageSource {
  hosted,
  git,
  path
}

// ---------------------------------- Parsers ----------------------------------

Version _versionFromString(String input) => Version.parse(input);