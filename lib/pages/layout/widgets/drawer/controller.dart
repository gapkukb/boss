import 'dart:math';

import 'package:get/get.dart';

class LayoutDrawerController extends GetxController {
  LayoutDrawerController();

  final width = 0.0.obs;

  _initData() {
    update(["user_drawer"]);
  }

  void onTap() {}

  @override
  void onInit() {
    // width = min(Get.width * 0.8, 300);
  }

  @override
  void onReady() {
    super.onReady();
    width.value = min(Get.width * 0.8, 300);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
