import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
