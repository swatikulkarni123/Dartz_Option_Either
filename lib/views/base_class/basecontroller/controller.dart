import 'package:dartz/dartz.dart';
import 'package:dartz_option_either/common/utils.dart';
import 'package:dartz_option_either/data/api/api_service_impl.dart';
import 'package:get/get.dart';
import '../../../data/api/api_service.dart';
import '../../../data/model/api_response.dart';

///Base controller -> handle all common function logic in one file.
///                     1. loading
///                     2. error message
///                     3. network check
///                     4. handle data and pass to respective controller using ApiSuccess class
class BaseController extends GetxController {
  ApiService apiServiceImpl = ApiServiceImpl();

  /// There is no need to handle multiple boolean variable to show whether api is fetching data or
  /// api given error or success response
  ///
  ///Option<Either<ApiFailure, List<dynamic>>> type can have no value or a value of type Either<ApiFailure, List<dynamic>>
  ///
  ///When apiResponse is none it means the api call is in progress
  /// When apiResponse is some(left(ApiFailure)) it means api call is not successful there is error occurred.
  /// When apiResponse is some(right(List<dynamic>))it means api call is successful.
  Option<Either<ApiFailure, List<dynamic>>> apiResponse = some(right([]));

  @override
  onInit() {
    super.onInit();
  }

  callApi(Future<Either<ApiFailure, List<dynamic>>> apiCall,
      {required ApiSuccess apiSuccess,
      screenName = "",
      skipLoader = false,
      showMessage = false,
      skipErrorLayout = false}) {
    if (!skipLoader) {
      apiResponse = none();
    }

    /// using some() Assign response
    /// Only if api fetch successful then pass data using ApiSuccess callback class
    apiCall.then((value) {
      value.fold(
        (apiFailure) => {
          apiResponse = some(left(apiFailure)),
          update(),
          //UtilsCLass.printLog("error => $apiResponse"),
        },
        (dataList) => {
          apiResponse = some(right(dataList)),
          update(),
          UtilsCLass.printLog("api fetch successful => $apiResponse"),

          /// pass successful response to corresponding controller method
          apiSuccess.dataList(dataList),
        },
      );
    });
  }
}
