import 'package:dio/dio.dart';

class DioClient {
  static BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://dummy.restapiexample.com/api/",
      contentType: Headers.jsonContentType,
      connectTimeout: 30000,
      receiveTimeout: 20000,
      headers: {
      });
  static final DioClient _dioClient = DioClient._internal();
  final Dio _dio = Dio(baseOptions);
  Dio get dio => _dio;
  factory DioClient() {
    return _dioClient;
  }
  DioClient._internal() {
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
}