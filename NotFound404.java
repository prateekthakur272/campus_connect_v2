import 'dart:io';

class NotFound404 extends HttpException {
  NotFound404(super.message);
  @override
  String toString() {
    return 'NotFound404: $message';
  }
}

class Forbidden403 extends HttpException {
  Forbidden403(super.message);
  @override
  String toString() {
    return 'Forbidden403: $message';
  }
}

class BadRequest400 extends HttpException {
  BadRequest400(super.message);
  @override
  String toString() {
    return 'BadRequest400: $message';
  }
}
