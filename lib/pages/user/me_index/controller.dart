import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MeIndexController extends GetxController {
  MeIndexController();
  final offset = 0.0.obs;
  final scrollerController = ScrollController();

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    scrollerController.addListener(() {
      offset.value = scrollerController.offset;
      print(offset.value);

      // print(scrollerController.position.maxScrollExtent);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollerController.dispose();
    super.onClose();
  }
}
