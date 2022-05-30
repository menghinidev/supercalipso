class ErrorDetails<T> {
  final int id;
  final String message;
  final T? customPayload;

  ErrorDetails({required this.id, this.message = '', this.customPayload});

  @override
  String toString() {
    return '''Error ID: $id
    Error Message: $message''';
  }
}
