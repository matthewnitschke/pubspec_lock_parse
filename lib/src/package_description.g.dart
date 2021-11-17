// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostedPackageDescription _$HostedPackageDescriptionFromJson(Map json) {
  return $checkedNew('HostedPackageDescription', json, () {
    final val = HostedPackageDescription(
      name: $checkedConvert(json, 'name', (v) => v as String),
      url: $checkedConvert(json, 'url', (v) => v as String),
    );
    return val;
  });
}

GitPackageDescription _$GitPackageDescriptionFromJson(Map json) {
  return $checkedNew('GitPackageDescription', json, () {
    final val = GitPackageDescription(
      path: $checkedConvert(json, 'path', (v) => v as String),
      ref: $checkedConvert(json, 'ref', (v) => v as String),
      resolvedRef: $checkedConvert(json, 'resolved-ref', (v) => v as String),
      url: $checkedConvert(json, 'url', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'resolvedRef': 'resolved-ref'});
}

PathPackageDescription _$PathPackageDescriptionFromJson(Map json) {
  return $checkedNew('PathPackageDescription', json, () {
    final val = PathPackageDescription(
      path: $checkedConvert(json, 'path', (v) => v as String),
      relative: $checkedConvert(json, 'relative', (v) => v as bool),
    );
    return val;
  });
}
