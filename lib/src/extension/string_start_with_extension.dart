extension StringStartWithExtension on String {
  /// Checks if the string starts with a digit (0-9).
  bool startsWithDigit() {
    if (isEmpty) return false;
    return this[0].codeUnitAt(0) >= 48 && this[0].codeUnitAt(0) <= 57;
  }
}
