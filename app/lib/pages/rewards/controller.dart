import 'package:get/get.dart';

class RewardsController extends GetxController {
  RewardsController();

  _initData() {
    update(["rewards"]);
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
