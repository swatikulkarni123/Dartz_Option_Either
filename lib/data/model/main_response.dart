import 'dart:convert';

MainResponse mainResponseFromJson(String str,Function(Map<String, dynamic>) create) =>
    MainResponse.fromJson(json.decode(str),create);

String mainResponseToJson(MainResponse data) => json.encode(data.toJson());

class MainResponse<T extends Serializable> {
  MainResponse({
    this.message,
    this.data,
    this.statusCode,
  });

  String? message;
  List<T>? data;
  int? statusCode;

  factory MainResponse.fromJson(Map<String, dynamic> json,Function(Map<String, dynamic>)? create) => MainResponse(
    message: json["message"] ?? "",
    data: json["data"] =create==null ? [] : create(json),
    statusCode: json["statusCode"] ?? 200,
  );

  Map<String, dynamic> toJson() => {
    "message": message ?? "",
    "data": data??[],
    "statusCode": statusCode ?? 0,
  };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}