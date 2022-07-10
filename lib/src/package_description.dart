import 'package:json_annotation/json_annotation.dart';

part 'package_description.g.dart';

PackageDescription packageDescriptionFromJson(Object data) {
  if (data is Map) {
    if (data.containsKey('ref')) {
      return GitPackageDescription.fromJson(data);
    } else if (data.containsKey('relative')) {
      return PathPackageDescription.fromJson(data);
    } else {
      return HostedPackageDescription.fromJson(data);
    }
  }

  throw FormatException('Unknown package description type');
}


abstract class PackageDescription {
  Map<String, dynamic> toJson();
}

@JsonSerializable()
class HostedPackageDescription extends PackageDescription {
  final String name;

  final String url;

  HostedPackageDescription({
    required this.name,
    required this.url,
  });

  factory HostedPackageDescription.fromJson(Map json) =>
      _$HostedPackageDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$HostedPackageDescriptionToJson(this);
}

@JsonSerializable()
class GitPackageDescription extends PackageDescription {
  final String path;

  final String ref;

  @JsonKey(name: 'resolved-ref')
  final String resolvedRef;

  final String url;

  GitPackageDescription({
    required this.path,
    required this.ref,
    required this.resolvedRef,
    required this.url,
  });

  factory GitPackageDescription.fromJson(Map json) =>
      _$GitPackageDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$GitPackageDescriptionToJson(this);
}

@JsonSerializable()
class PathPackageDescription extends PackageDescription {
  final String path;

  final bool relative;

  PathPackageDescription({
    required this.path,
    required this.relative,
  });

  factory PathPackageDescription.fromJson(Map json) =>
      _$PathPackageDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$PathPackageDescriptionToJson(this);
}
