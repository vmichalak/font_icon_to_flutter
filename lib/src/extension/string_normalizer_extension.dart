final _toCamelCaseRegex = RegExp('(?<=[-|_])[a-z]');

extension StringNormalizerExtension on String {
  /// Converts a kebab-case or snake_case string to camelCase format.
  String toCamelCase() => replaceAllMapped(
        _toCamelCaseRegex,
        (m) => '${m.group(0)?[0].toUpperCase()}${m.group(0)?.substring(1)}',
      ).replaceAll('-', '').replaceAll('_', '');

  /// Normalizes line endings in the given text by converting Windows-style line
  /// endings (\r\n) to Unix-style line endings (\n).
  ///
  /// @return Create a new string with all \r\n sequences converted to \n
  String normalizeLineEndings() => replaceAll('\r\n', '\n');
}
