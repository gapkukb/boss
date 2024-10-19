import 'package:get/get.dart';

class MomentsController extends GetxController {
  MomentsController();

  _initData() {
    update(["moments"]);
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
