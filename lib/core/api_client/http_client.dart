import 'package:campus_connect_v2/core/logger/logger.dart';
import 'package:dio/dio.dart';
import 'http_exceptions.dart';
import 'typedefs.dart';

final logger = Logger('HttpClient');

class HttpClient {
  final Dio _dio = Dio();

  HttpClient() {
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Handle request here (e.g., add auth token)
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if(response.data is! Map<String, dynamic>){
          response.data = {
            'data': response.data
          };
        }
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  Future<Json> get(String url, [Header? headers]) async {
    final request = _dio.get(url,
        options: Options(
          headers: headers,
        ));
    return requestHandler(request);
  }

  Future<Json> post(String url, Json body, [Header? headers]) async {
    final request = _dio.post(url,
        data: body,
        options: Options(
          headers: headers,
        ));
    return requestHandler(request);
  }

  Future<Json> requestHandler(Future<Response<dynamic>> request) async {
    try {
      final response = await request;
      return response.data;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw HttpClientException(
              'Connection Timeout', e.response?.statusCode);
        case DioExceptionType.sendTimeout:
          throw HttpClientException(
              'Send Timeout', e.response?.statusCode);
        case DioExceptionType.receiveTimeout:
          throw HttpClientException(
              'Receive Timeout', e.response?.statusCode);
        case DioExceptionType.badCertificate:
          throw HttpClientException(
              'Bad Certificate', e.response?.statusCode);
        // case DioExceptionType.badResponse:
        //   throw HttpClientException(
        //       'Bad Response', e.response?.statusCode);
        case DioExceptionType.cancel:
          throw HttpClientException(
              'Request Canceled', e.response?.statusCode);
        case DioExceptionType.connectionError:
          throw HttpClientException(
              'No Connection', e.response?.statusCode);
        case DioExceptionType.unknown:
          throw HttpClientException('Unknown', e.response?.statusCode);
        default:
          throw HttpClientException(
              e.response?.statusMessage ?? 'some error occurred',
              e.response?.statusCode);
      }
    }
  }
}
