import 'package:dartz_option_either/common/utils.dart';
import 'package:dartz_option_either/data/model/list_of_emp.dart';
import 'package:dartz_option_either/views/list_view/controller/list_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_class/baseview/base_view.dart';

// ignore: must_be_immutable
class ListViewWidget extends BaseView<ListViewController> {
  ListViewWidget({Key? key}) : super(key: const Key("list"));

  @override
  String appBarName() {
    UtilsCLass.printLog("inside listview appbarname");
    return "List View";
  }

  ///Don't worry about the error. The base view handles all errors
  @override
  Widget body(BuildContext context) {
    return Obx(() {
      UtilsCLass.printLog(
          "in listView = ${baseController.responseData.toString()}");
      return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: baseController.responseData.map((element) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: getListItem(element, context),
              );
            }).toList()),
      );
    });
  }

  Widget getListItem(ListOfEmployee element, context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(top: 2),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(element.employeeName ?? ""),
            Text("${element.employeeAge ?? 0}"),
            Text("${element.employeeSalary ?? 0}"),
          ],
        ),
      ),
    );
  }
}
