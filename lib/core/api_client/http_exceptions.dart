import 'dart:io';

class HttpClientException extends HttpException{
  final int? statusCode;
  HttpClientException(super.message, this.statusCode);

  @override
  String toString() {
    return 'HttpClientException: ${statusCode??''} $message';
  }
}