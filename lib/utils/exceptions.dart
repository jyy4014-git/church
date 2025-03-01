class CustomException implements Exception {
  String message;
  int statusCode;

  CustomException({required this.message, required this.statusCode});
}
