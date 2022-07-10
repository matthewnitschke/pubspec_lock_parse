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
              'description', (v) => packageDescriptionFromJson(v as Object)),
          source: $checkedConvert(
              'source', (v) => $enumDecode(_$PackageSourceEnumMap, v)),
          version: $checkedConvert(
              'version', (v) => _versionFromString(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'dependency': instance.dependency,
      'description': instance.description.toJson(),
      'source': _$PackageSourceEnumMap[instance.source]!,
      'version': _versionToString(instance.version),
    };

const _$PackageSourceEnumMap = {
  PackageSource.hosted: 'hosted',
  PackageSource.git: 'git',
  PackageSource.path: 'path',
};
