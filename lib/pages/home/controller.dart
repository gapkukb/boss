import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../live_stream/index.dart';
import '../recommendation/index.dart';

class HomeTab {
  final String title;
  final Widget view;

  const HomeTab({required this.title, required this.view});
}

class HomeController extends GetxController {
  HomeController();

  final initialIndex = 0.obs;

  final List<HomeTab> tabs = [
    HomeTab(title: "直播", view: LiveStreamPage()),
    HomeTab(title: "推荐", view: RecommendationPage()),
    HomeTab(title: "追番", view: FlutterLogo()),
    HomeTab(title: "国创", view: FlutterLogo()),
    HomeTab(title: "影视", view: FlutterLogo()),
    HomeTab(title: "舞蹈", view: FlutterLogo()),
    HomeTab(title: "音乐", view: FlutterLogo()),
    HomeTab(title: "游戏", view: FlutterLogo()),
    HomeTab(title: "科技", view: FlutterLogo()),
    HomeTab(title: "数码", view: FlutterLogo()),
    HomeTab(title: "生活", view: FlutterLogo()),
    HomeTab(title: "鬼畜", view: FlutterLogo()),
    HomeTab(title: "时尚", view: FlutterLogo()),
    HomeTab(title: "广告", view: FlutterLogo()),
    HomeTab(title: "娱乐", view: FlutterLogo()),
  ];

  _initData() {
    update(["home"]);
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
