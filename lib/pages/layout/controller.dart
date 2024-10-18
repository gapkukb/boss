import 'package:get/get.dart';

import 'widgets/bottom_navigator/index.dart';

class LayoutController extends GetxController {
  LayoutController();

  _initData() {
    update(["layout"]);
  }

  void onTap() {}

  @override
  void onInit() {
    Get.put(LayoutBottomNavigatorController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
