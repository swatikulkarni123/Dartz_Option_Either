import 'package:dartz_option_either/views/home_view/controller/home_view_controller.dart';
import 'package:dartz_option_either/views/list_view/controller/list_view_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ListViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListViewController());
  }
}
