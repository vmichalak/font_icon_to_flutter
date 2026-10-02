import 'package:font_icon_to_flutter/src/icon_class_generator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('IconClassGenerator', () {
    test('icons are output in alphabetical order', () {
      const input = r'''
@font-face {
  font-family: "Iconly";
}

.icon-zebra:before {
  content: "\e003";
}

.icon-apple:before {
  content: "\e001";
}

.icon-mango:before {
  content: "\e002";
}

.icon-banana:before {
  content: "\e000";
}''';

      const expected = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:flutter/material.dart';

@staticIconProvider
class Iconly {
  static const String _font = 'Iconly';

  static const IconData apple =
    IconData(0xe001, fontFamily: _font);
  static const IconData banana =
    IconData(0xe000, fontFamily: _font);
  static const IconData mango =
    IconData(0xe002, fontFamily: _font);
  static const IconData zebra =
    IconData(0xe003, fontFamily: _font);
}

''';

      final output = IconClassGenerator.fromIconlyIo(
        content: input,
        className: 'Iconly',
        fontFamily: 'Iconly',
      );

      expect(output, expected);
    });
  });
}
