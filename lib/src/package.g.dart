// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map json) {
  return $checkedNew('Package', json, () {
    final val = Package(
      dependency: $checkedConvert(json, 'dependency', (v) => v as String),
      description: $checkedConvert(
          json, 'description', (v) => parsePackageDescription(v)),
      source: $checkedConvert(json, 'source',
          (v) => _$enumDecodeNullable(_$PackageSourceEnumMap, v)),
      version: $checkedConvert(
          json, 'version', (v) => _versionFromString(v as String)),
    );
    return val;
  });
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PackageSourceEnumMap = {
  PackageSource.hosted: 'hosted',
  PackageSource.git: 'git',
  PackageSource.path: 'path',
};
