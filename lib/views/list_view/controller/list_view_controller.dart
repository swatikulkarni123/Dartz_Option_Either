import 'package:dartz_option_either/common/utils.dart';
import 'package:dartz_option_either/data/model/api_response.dart';
import 'package:dartz_option_either/data/model/list_of_emp.dart';
import 'package:dartz_option_either/views/base_class/basecontroller/controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ListViewController extends BaseController {
  @override
  onInit() {
    super.onInit();
    getList();
  }

  RxList<ListOfEmployee> responseData = RxList();

  void getList() {
    callApi(apiServiceImpl.getListOfData(),
        apiSuccess: ApiSuccess(dataList: (data) {
      UtilsCLass.printLog("listViewController => $data");
      responseData.addAll(data as List<ListOfEmployee>);
    }));
  }
}
