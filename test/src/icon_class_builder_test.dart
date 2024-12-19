import 'package:font_icon_to_flutter/src/icon_class_builder.dart';
import 'package:font_icon_to_flutter/src/model/icon_mapping.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('IconClassBuilder', () {
    test('generate icon class', () {
      const expected = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';

@staticIconProvider
class Iconly {
  static const String _font = 'Iconly';
  static const String _package = 'Iconly';

  static const IconData youtube =
    IconData(0xe000, fontFamily: _font, fontPackage: _package);
}

''';
      final builder = IconClassBuilder.getBuilder('Iconly', 'Iconly', 'Iconly')
        ..addIconMapping(const IconMapping(key: 'youtube', codePoint: 'e000'));
      expect(builder.build(), expected);
    });
  });
}
