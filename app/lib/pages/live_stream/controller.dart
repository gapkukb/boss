import 'package:get/get.dart';

class LiveStreamController extends GetxController {
  LiveStreamController();

  _initData() {
    update(["live_stream"]);
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
