import 'package:dartz/dartz.dart';

import '../model/api_response.dart';

abstract class ApiService{
   Future<Either<ApiFailure, List<dynamic>>> getListOfData();
}