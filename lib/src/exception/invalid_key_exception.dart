class InvalidKeyException implements Exception {
  InvalidKeyException({required this.key});

  final String key;

  @override
  String toString() {
    return 'InvalidKeyException: $key is an invalid key value';
  }
}
