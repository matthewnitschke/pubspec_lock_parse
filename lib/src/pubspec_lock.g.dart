// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubspec_lock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PubspecLock _$PubspecLockFromJson(Map json) {
  return $checkedNew('PubspecLock', json, () {
    final val = PubspecLock(
      packages:
          $checkedConvert(json, 'packages', (v) => parsePackages(v as Map)),
      sdks: $checkedConvert(json, 'sdks', (v) => _parseSdks(v as Map)),
    );
    return val;
  });
}
