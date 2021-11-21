// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostedPackageDescription _$HostedPackageDescriptionFromJson(Map json) =>
    $checkedCreate(
      'HostedPackageDescription',
      json,
      ($checkedConvert) {
        final val = HostedPackageDescription(
          name: $checkedConvert('name', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );

GitPackageDescription _$GitPackageDescriptionFromJson(Map json) =>
    $checkedCreate(
      'GitPackageDescription',
      json,
      ($checkedConvert) {
        final val = GitPackageDescription(
          path: $checkedConvert('path', (v) => v as String),
          ref: $checkedConvert('ref', (v) => v as String),
          resolvedRef: $checkedConvert('resolved-ref', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'resolvedRef': 'resolved-ref'},
    );

PathPackageDescription _$PathPackageDescriptionFromJson(Map json) =>
    $checkedCreate(
      'PathPackageDescription',
      json,
      ($checkedConvert) {
        final val = PathPackageDescription(
          path: $checkedConvert('path', (v) => v as String),
          relative: $checkedConvert('relative', (v) => v as bool),
        );
        return val;
      },
    );
