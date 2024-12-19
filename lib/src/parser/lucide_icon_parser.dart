import 'package:font_icon_to_flutter/src/extension/string_normalizer_extension.dart';
import 'package:font_icon_to_flutter/src/model/icon_mapping.dart';
import 'package:font_icon_to_flutter/src/parser/icon_parser.dart';

class LucideIconParser implements IconParser {
  final _regExp = RegExp(
    r'.icon-(.*):before { *content: "\\(.*)";',
    multiLine: true,
  );

  @override
  Iterable<IconMapping> parse(String input) =>
      _regExp.allMatches(input).where((it) => it.groupCount >= 2).map((it) {
        return IconMapping(
          key: it.group(1)!.toCamelCase(),
          codePoint: it.group(2)!,
        );
      });
}
