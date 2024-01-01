class AppException implements Exception {
  AppException({required this.message});

  String message;
}
class InternetException extends AppException {
  InternetException() : super(message: 'No Internet connection');
}

class RequestTimeOUtException extends AppException {
  RequestTimeOUtException() : super(message: 'Request time out');
}

class BadRequestException extends AppException {
  BadRequestException() : super(message: 'Something went wrong');
}