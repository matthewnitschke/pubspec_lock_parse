// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubspec_lock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PubspecLock _$PubspecLockFromJson(Map json) => $checkedCreate(
      'PubspecLock',
      json,
      ($checkedConvert) {
        final val = PubspecLock(
          packages: $checkedConvert('packages', (v) => parsePackages(v as Map)),
          sdks: $checkedConvert('sdks', (v) => _parseSdks(v as Map)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PubspecLockToJson(PubspecLock instance) =>
    <String, dynamic>{
      'packages': instance.packages.map((k, e) => MapEntry(k, e.toJson())),
      'sdks': _serializeSdks(instance.sdks),
    };
