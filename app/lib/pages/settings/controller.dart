import 'package:get/get.dart';

class SettingsController extends GetxController {
  SettingsController();
  final List<String> settings = [
    "账号与安全",
    "隐私",
    "通用",
    "关于",
  ];
  _initData() {
    update(["settings"]);
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
