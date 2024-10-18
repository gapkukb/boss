import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/pages.dart';
import '../../../../widgets/x_icon.dart';

class LayoutBottomNavigatorController extends GetxController {
  LayoutBottomNavigatorController();

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: XIcon(icon: Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: XIcon(icon: Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: XIcon(icon: Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: XIcon(icon: Icons.home),
      label: "首页",
    ),
  ];
  final currentIndex = 0.obs;

  void onTap(int index) {
    currentIndex.value = index;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    final view = AppPages.pages.firstWhereOrNull((page) => settings.name == page.name);

    if (view == null) return null;

    return GetPageRoute(
      settings: settings,
      page: view.page,
      binding: view.binding,
    );
  }
}
