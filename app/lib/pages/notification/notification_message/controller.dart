import 'package:get/get.dart';

class NotificationMessageController extends GetxController {
  NotificationMessageController();

  _initData() {
    update(["notification_message"]);
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
