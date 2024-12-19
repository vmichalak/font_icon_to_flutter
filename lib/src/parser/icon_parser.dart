import 'package:font_icon_to_flutter/src/model/icon_mapping.dart';

abstract class IconParser {
  Iterable<IconMapping> parse(String input);
}
