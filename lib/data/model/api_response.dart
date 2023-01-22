class ApiFailure {
  ApiResponseError error;
  int statusCode = 0;
  String message = "";
  ApiFailure({this.statusCode = 0, this.message = "", required this.error});
}

class ApiSuccess {
  void Function(List<dynamic> data) dataList;
  ApiSuccess({required this.dataList});
}

enum ApiResponseError {
  // ignore: constant_identifier_names
  loading,
  error,
  success,
  dio_error,
  no_network,
}
