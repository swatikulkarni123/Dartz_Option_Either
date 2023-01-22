import 'package:dartz/dartz.dart';
import 'package:dartz_option_either/data/api/api_client.dart';
import 'package:dartz_option_either/data/api/api_service.dart';
import 'package:dartz_option_either/data/model/list_of_emp.dart';
import 'package:dio/dio.dart';

import '../model/api_response.dart';
import '../model/main_response.dart';

class ApiServiceImpl extends ApiService {
  ApiClient apiClient = ApiClient();

  @override
  Future<Either<ApiFailure, List<dynamic>>> getListOfData() async {
    try {
      var response = await apiClient.get("v1/employees/");
      var mainResponse = MainResponse<ListOfEmployee>.fromJson(
        response,
        (data) => List<ListOfEmployee>.from(
          data == null
              ? []
              : data["data"].map(
                  (x) => ListOfEmployee.fromJson(x),
                ),
        ),
      );
      if (mainResponse != null && mainResponse.statusCode == 200) {
        return right(mainResponse.data ?? []);
      } else {
        if (mainResponse != null) {
          ApiFailure apiFailure = ApiFailure(
              error: ApiResponseError.error,
              message: mainResponse.message ?? "",
              statusCode: 400);
          return left(apiFailure);
        }
        ApiFailure apiFailure = ApiFailure(
            error: ApiResponseError.error,
            message: "Something went wrong",
            statusCode: 500);
        return left(apiFailure);
      }
    } on DioError catch (e) {
      ApiFailure apiFailure = ApiFailure(
          error: ApiResponseError.dio_error,
          message: e.message,
          statusCode: 500);
      return left(apiFailure);
    } catch (e) {
      ApiFailure apiFailure = ApiFailure(
          error: ApiResponseError.error,
          message: e.toString(),
          statusCode: 500);
      return left(apiFailure);
    }
  }
}
