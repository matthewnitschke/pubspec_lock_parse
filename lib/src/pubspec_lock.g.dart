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
