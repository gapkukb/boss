import 'package:get/get.dart';

class ReferrerController extends GetxController {
  ReferrerController();

  _initData() {
    update(["referrer"]);
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
