import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class RecommendationController extends GetxController {
  RecommendationController();
  final current = 0.obs;
  final List<String> slides = ['1', '2', '3', '4', '5', '6'];

  _initData() {
    update(["recommendation"]);
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
