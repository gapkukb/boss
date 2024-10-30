import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../global/global.dart';
import '../../routes/pages.dart';

class SplashController extends GetxController {
  SplashController();
  final current = 0.obs;
  late final pageController = PageController();

  void onPrevious() {
    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void onNext() {
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void onSkip() {
    Get.toNamed(Routes.HOME);
  }

  void start() {
    //TODO:持久化；
    // Global.
    onSkip();
  }

  @override
  void onInit() {
    //TODO: 检查是否已经展示过，是则回到首页；
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
