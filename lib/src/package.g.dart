// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map json) => $checkedCreate(
      'Package',
      json,
      ($checkedConvert) {
        final val = Package(
          dependency: $checkedConvert('dependency', (v) => v as String),
          description: $checkedConvert(
              'description', (v) => parsePackageDescription(v as Object)),
          source: $checkedConvert(
              'source', (v) => $enumDecode(_$PackageSourceEnumMap, v)),
          version: $checkedConvert(
              'version', (v) => _versionFromString(v as String)),
        );
        return val;
      },
    );

const _$PackageSourceEnumMap = {
  PackageSource.hosted: 'hosted',
  PackageSource.git: 'git',
  PackageSource.path: 'path',
};
