import 'package:get/get.dart';

class NotificationNotificationController extends GetxController {
  NotificationNotificationController();

  _initData() {
    update(["notification_notification"]);
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
