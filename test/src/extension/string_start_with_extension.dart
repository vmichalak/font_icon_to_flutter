import 'package:font_icon_to_flutter/src/extension/string_start_with_extension.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('String.startWithDigit()', () {
    test('on empty string', () {
      expect(''.startsWithDigit(), false);
    });

    test('should return true', () {
      expect('1TwoThree'.startsWithDigit(), true);
      expect('987SixFive'.startsWithDigit(), true);
      expect('1337'.startsWithDigit(), true);
    });

    test('should return false', () {
      expect('one'.startsWithDigit(), false);
      expect('t2wo'.startsWithDigit(), false);
      expect('three3'.startsWithDigit(), false);
    });
  });
}
