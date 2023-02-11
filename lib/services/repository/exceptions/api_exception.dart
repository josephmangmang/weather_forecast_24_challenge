class ApiRequestException implements Exception {
  final String _message;

  ApiRequestException(this._message);

  @override
  String toString() => _message;
}
