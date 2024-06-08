import 'package:campus_connect_v2/core/http_client/typedefs.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.baseUrl =
        'https://api.example.com'; // Replace with your API base URL
    _dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 3); // 3 seconds
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Add interceptors if needed
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Handle request here (e.g., add auth token)
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Handle response here
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
        // log(e.response!.statusCode.toString());
        // throw const HttpException('Some Error Occurred');
      },
    ));
  }

  Future<Json> get(String url, [Header? headers]) async {
    final response = await _dio.get(url,
        options: Options(
          headers: headers,
        ));
    return response.data;
  }

  Future<Json> post(String url, Json body, [Header? headers]) async {
    final response = await _dio.post(url,
        data: body,
        options: Options(
          headers: headers,
        ));
    return response.data;
  }
}
