import 'package:dio/dio.dart';

import 'DioClient.dart';

class ApiClient {
  final Dio httpClient = DioClient().dio;

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    Options options = Options(headers: headers);
    var response = await httpClient.get(url, options: options);
    return response.data;
  }
}
