import 'package:get/get.dart';

class UserDrawerController extends GetxController {
  UserDrawerController();

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
