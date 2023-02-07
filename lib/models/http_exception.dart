class HttpExcection implements Exception {
  final String message;

  HttpExcection(this.message);

  @override
  String toString() {
    return message;
  }
}
