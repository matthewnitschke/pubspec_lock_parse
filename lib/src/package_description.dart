
import 'package:json_annotation/json_annotation.dart';

part 'package_description.g.dart';

PackageDescription parsePackageDescription(Object data) {
  if (data is Map) {
    if (data.containsKey('ref')) {
      return GitPackageDescription.fromJson(data);
    } else if (data.containsKey('relative')) {
      return PathPackageDescription.fromJson(data);
    } else {
      return HostedPackageDescription.fromJson(data);
    }
  }
}

abstract class PackageDescription { }

@JsonSerializable()
class HostedPackageDescription extends PackageDescription {
  final String name;

  final String url;

  HostedPackageDescription({ this.name, this.url });

  factory HostedPackageDescription.fromJson(Map json) => _$HostedPackageDescriptionFromJson(json);
}

@JsonSerializable()
class GitPackageDescription extends PackageDescription {
  final String path;

  final String ref;
  
  @JsonKey(name: 'resolved-ref')
  final String resolvedRef;
  
  final String url;

  GitPackageDescription({ this.path, this.ref, this.resolvedRef, this.url });

  factory GitPackageDescription.fromJson(Map json) => _$GitPackageDescriptionFromJson(json);
}

@JsonSerializable()
class PathPackageDescription extends PackageDescription {
  final String path;
  
  final bool relative;

  PathPackageDescription({ this.path, this.relative });

  factory PathPackageDescription.fromJson(Map json) => _$PathPackageDescriptionFromJson(json);
}

