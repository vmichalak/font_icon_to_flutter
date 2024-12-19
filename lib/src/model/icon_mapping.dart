import 'package:meta/meta.dart';

@immutable
class IconMapping {
  const IconMapping({required this.key, required this.codePoint});

  final String key;
  final String codePoint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconMapping &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          codePoint == other.codePoint;

  @override
  int get hashCode => key.hashCode ^ codePoint.hashCode;
}
