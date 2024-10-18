import 'package:get/get.dart';

class LayoutDrawerController extends GetxController {
  LayoutDrawerController();

  _initData() {
    update(["user_drawer"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

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
