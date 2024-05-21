// ignore_for_file: file_names, prefer_typing_uninitialized_variables

class ApiException implements Exception {
  final statusCode;
  final message;
  ApiException({this.statusCode, this.message});

  @override
  String toString() {
    return message;
  }
}
