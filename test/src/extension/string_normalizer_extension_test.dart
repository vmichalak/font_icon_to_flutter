import 'package:font_icon_to_flutter/src/extension/string_normalizer_extension.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('String.toCamelCase()', () {
    test("''.toCamelCase()", () {
      expect(''.toCamelCase(), '');
    });

    test("'camelCase'.toCamelCase()", () {
      expect('camelCase'.toCamelCase(), 'camelCase');
      expect('myIcon'.toCamelCase(), 'myIcon');
    });

    test("'snake_case'.toCamelCase()", () {
      expect('snake_case'.toCamelCase(), 'snakeCase');
      expect('my_icon'.toCamelCase(), 'myIcon');
    });

    test("'kebab-case'.toCamelCase()", () {
      expect('kebab-case'.toCamelCase(), 'kebabCase');
      expect('my_icon'.toCamelCase(), 'myIcon');
    });
  });

  group('String.normalizeLineEndings()', () {
    test('normalize line endings of empty string', () {
      expect(''.normalizeLineEndings(), '');
    });

    test('normalize windows line endings', () {
      expect('abcdef\r\nghijklm'.normalizeLineEndings(), 'abcdef\nghijklm');
    });

    test('normalize linux line endings', () {
      expect('abcdef\nghijklm'.normalizeLineEndings(), 'abcdef\nghijklm');
    });
  });
}
