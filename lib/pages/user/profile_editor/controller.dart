import 'package:get/get.dart';

class ProfileEditorController extends GetxController {
  ProfileEditorController();

  _initData() {
    update(["profile_editor"]);
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
