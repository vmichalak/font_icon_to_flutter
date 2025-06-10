import 'package:font_icon_to_flutter/src/extension/string_normalizer_extension.dart';
import 'package:font_icon_to_flutter/src/icon_class_builder.dart';
import 'package:font_icon_to_flutter/src/parser/font_awesome_icon_parser.dart';
import 'package:font_icon_to_flutter/src/parser/icon_parser.dart';
import 'package:font_icon_to_flutter/src/parser/iconly_io_icon_parser.dart';
import 'package:font_icon_to_flutter/src/parser/lucide_icon_parser.dart';

class IconClassGenerator {
  static String _generate({
    required IconParser parser,
    required String content,
    required String className,
    required String fontFamily,
    String? fontPackage,
  }) {
    final builder =
        IconClassBuilder.getBuilder(className, fontFamily, fontPackage);

    parser.parse(content.normalizeLineEndings()).forEach((it) {
      try {
        builder.addIconMapping(it);
      } on Exception catch (e) {
        // Explicitly ignore Exception and log it.
        print('Icon ignored because of $e');
      }
    });

    return builder.build();
  }

  static String fromIconlyIo({
    required String content,
    required String className,
    required String fontFamily,
    String? fontPackage,
  }) =>
      _generate(
        parser: IconlyIoIconParser(),
        content: content,
        className: className,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
      );

  static String fromLucide({
    required String content,
    required String className,
    required String fontFamily,
    String? fontPackage,
  }) =>
      _generate(
        parser: LucideIconParser(),
        content: content,
        className: className,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
      );

  static String fromFontAwesome({
    required String content,
    required String className,
    required String fontFamily,
    String? fontPackage,
  }) =>
      _generate(
        parser: FontAwesomeIconParser(),
        content: content,
        className: className,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
      );
}
