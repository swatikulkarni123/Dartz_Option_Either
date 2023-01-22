import 'package:dartz_option_either/common/utils.dart';
import 'package:dartz_option_either/data/model/api_response.dart';
import 'package:dartz_option_either/views/base_class/basecontroller/controller.dart';
import 'package:dartz_option_either/views/base_class/baseview/error_view/page_not_found_view.dart';
import 'package:dartz_option_either/views/base_class/baseview/error_view/something_went_wrong.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// BaseView is a abstract widget class used to handle api response and return body view if response is successfully
/// otherwise handle error message view itself
/// No need to worry about loader or error and other common stuff. Base view handle itself
/// T is a generic Type of Controller that extends BaseController.
///
abstract class BaseView<T extends BaseController> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  /// find Controller of T instance
  /// GetInstance find controller in binding . there is need to define controller in lazy put in Binding class
  // ex Get.lazyPut(() => HomeController());
  T get baseController => GetInstance().find<T>();

  ///"GetBuilder" is used to update screen or variable whenever update is called
  @override
  Widget build(BuildContext context) {
    UtilsCLass.printLog("controller baseController  $baseController");
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarName()),
      ),
      body: GetBuilder(
        init: baseController,
        builder: (controller) {
          UtilsCLass.printLog("In Base build View $baseController");
          return (controller as BaseController).apiResponse.fold(
            () {
              ///if api call is in progress
              return const Center(child: CircularProgressIndicator());
            },
            (a) => a.fold(
              /// Api response
              (l) => showErrorView(l),

              /// error response
              (r) => body(context),

              /// successfully response
              /// if(r.isEmpty) show empty widget
            ),
          );
        },
      ),
    );
  }

  Widget getView(BuildContext context) {
    return baseController.apiResponse.fold(
      () {
        return const Center(child: CircularProgressIndicator());
      },
      (a) => a.fold((l) => showErrorView(l), (r) => body(context)),
    );
  }

  Widget body(BuildContext context);

  String appBarName();

  Widget showErrorView(ApiFailure apiFailure) {
    if (apiFailure.statusCode == 404) {
      return PageNotFoundView(apiFailure: apiFailure);
    }
    return CommonErrorLayout(apiFailure: apiFailure);
  }
}
