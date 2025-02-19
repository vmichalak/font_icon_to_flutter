import 'package:font_icon_to_flutter/src/exception/invalid_key_exception.dart';
import 'package:font_icon_to_flutter/src/extension/string_start_with_extension.dart';
import 'package:font_icon_to_flutter/src/model/icon_mapping.dart';

class IconClassBuilder {
  // Private constructor to enforce the use of the factory method .getBuilder();
  // ignore: unused_element
  IconClassBuilder._(this._buffer, this._haveFontPackage);

  IconClassBuilder.getBuilder(
    String className,
    String fontFamily,
    String? fontPackage,
  )   : _buffer = _initBuffer(className, fontFamily, fontPackage),
        _haveFontPackage = fontPackage != null;

  static StringBuffer _initBuffer(
    String className,
    String fontFamily,
    String? fontPackage,
  ) {
    final buffer = StringBuffer()
      ..writeln('// GENERATED CODE - DO NOT MODIFY BY HAND')
      ..writeln("import 'package:flutter/material.dart';")
      ..writeln()
      ..writeln('@staticIconProvider')
      ..writeln('class $className {')
      ..writeln("  static const String _font = '$fontFamily';");
    if (fontPackage != null) {
      buffer.writeln("  static const String _package = '$fontPackage';");
    }
    buffer.writeln();
    return buffer;
  }

  final bool _haveFontPackage;
  final StringBuffer _buffer;

  void addIconMapping(IconMapping mapping) =>
      addIcon(mapping.key, mapping.codePoint);

  void addIcon(String key, String codePoint) {
    if (key.startsWithDigit()) {
      throw InvalidKeyException(key: key);
    }
    _buffer
      ..writeln('  static const IconData $key =')
      ..write('    IconData(0x$codePoint, fontFamily: _font');
    if (_haveFontPackage) {
      _buffer.write(', fontPackage: _package');
    }
    _buffer.write(');\n');
  }

  String build() {
    _buffer
      ..writeln('}')
      ..writeln();
    return _buffer.toString();
  }
}
