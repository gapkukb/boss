import 'package:get/get.dart';

class UserHomeController extends GetxController {
  UserHomeController();

  _initData() {
    update(["user_home"]);
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
