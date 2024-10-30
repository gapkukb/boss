import 'package:get/get.dart';

class SlotGameController extends GetxController {
  SlotGameController();

  final loading = true.obs;

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 2), () {
      loading.value = true;
    });
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
