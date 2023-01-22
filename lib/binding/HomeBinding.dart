import 'package:dartz_option_either/views/home_view/controller/home_view_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewController());
  }
}