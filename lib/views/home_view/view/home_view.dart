import 'package:dartz_option_either/common/utils.dart';
import 'package:dartz_option_either/views/base_class/basecontroller/controller.dart';
import 'package:dartz_option_either/views/base_class/baseview/base_view.dart';
import 'package:dartz_option_either/views/home_view/controller/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeView extends BaseView<HomeViewController> {
  HomeView({Key? key}) : super(key: const Key("home"));
  @override
  String appBarName() {
    return ("Option and Either Example Home View");
  }

  @override
  Widget body(BuildContext context) {
    UtilsCLass.printLog("in Home view body");
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/list");
            },
            // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
            style: ElevatedButton.styleFrom(
                elevation: 12.0,
                textStyle: const TextStyle(color: Colors.white)),
            child: const Text('Get List of Notice'),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.toNamed("/page_401");
          //   },
          //   // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
          //   style: ElevatedButton.styleFrom(
          //       elevation: 12.0,
          //       textStyle: const TextStyle(color: Colors.white)),
          //   child: const Text('Go to page 401'),
          // ),
        ],
      ),
    );
  }
}
