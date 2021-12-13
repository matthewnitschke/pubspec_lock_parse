import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:pubspec_lock_parse/pubspec_lock_parse.dart';

import 'test_utils.dart';

void main() {
  test('minimal set values', () {
    final value = parse(defaultPubspecLock);
    expect(value.packages, isEmpty);
    expect(value.sdks['dart'], VersionConstraint.parse('>=2.7.0 <3.0.0'));
  });

  group('package types -', () {
    test('hosted', () {
      final value = parse({
        ...defaultPubspecLock,
        'packages': {
          ...hostedPackage(
              name: 'package_a',
              url: 'https://pub.dartlang.org',
              version: '1.2.3')
        }
      });

      final package = value.packages['package_a']!;
      expect(package.dependency, 'transitive');
      expect(package.description is HostedPackageDescription, isTrue);
      expect(package.version, Version.parse('1.2.3'));

      final packageDescription =
          package.description as HostedPackageDescription;
      expect(packageDescription.name, 'package_a');
      expect(packageDescription.url, 'https://pub.dartlang.org');
    });

    test('git', () {
      final value = parse({
        ...defaultPubspecLock,
        'packages': {
          ...gitPackage(
              name: 'package_a',
              path: '../path',
              ref: 'some-branch-name',
              resolvedRef: 'abcdefg',
              url: 'git@github.com:SomeOrg/SomeRepo.git',
              version: '1.2.3')
        }
      });

      final package = value.packages['package_a']!;
      expect(package.dependency, 'transitive');
      expect(package.description is GitPackageDescription, isTrue);
      expect(package.version, Version.parse('1.2.3'));

      final packageDescription = package.description as GitPackageDescription;
      expect(packageDescription.path, '../path');
      expect(packageDescription.ref, 'some-branch-name');
      expect(packageDescription.resolvedRef, 'abcdefg');
      expect(packageDescription.url, 'git@github.com:SomeOrg/SomeRepo.git');
    });

    test('path', () {
      final value = parse({
        ...defaultPubspecLock,
        'packages': {
          ...pathPackage(
              name: 'package_a',
              path: '../path',
              isRelative: true,
              version: '1.2.3')
        }
      });

      final package = value.packages['package_a']!;
      expect(package.dependency, 'direct');
      expect(package.description is PathPackageDescription, isTrue);
      expect(package.version, Version.parse('1.2.3'));

      final packageDescription = package.description as PathPackageDescription;
      expect(packageDescription.path, '../path');
      expect(packageDescription.relative, isTrue);
    });
  });
}
