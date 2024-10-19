import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/pages.dart';
import '../../../../widgets/x_icon.dart';

class Item extends BottomNavigationBarItem {
  final String name;
  const Item({
    required super.icon,
    required this.name,
    super.label,
  });
}

class LayoutBottomNavigatorController extends GetxController {
  LayoutBottomNavigatorController();

  final List<Item> items = const [
    Item(
      icon: XIcon(icon: Icons.home),
      label: "首页",
      name: Routes.HOME,
    ),
    Item(
      icon: XIcon(icon: Icons.home),
      label: "登录",
      name: Routes.LOGIN,
    ),
    Item(
      icon: XIcon(icon: Icons.home),
      label: "论坛",
      name: Routes.LOGIN,
    ),
    Item(
      icon: XIcon(icon: Icons.home),
      label: "PIN",
      name: Routes.PIN,
    ),
    Item(
      icon: XIcon(icon: Icons.home),
      label: "我的",
      name: Routes.PROFILE,
    ),
  ];

  final currentIndex = 0.obs;

  void onTap(int index) {
    currentIndex.value = index;
    Get.toNamed(items[index].name, id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    final view = AppPages.pages.firstWhereOrNull((page) => settings.name == page.name);

    print(settings);
    print(view);

    if (view == null) return null;

    return GetPageRoute(
      settings: settings,
      page: view.page,
      binding: view.binding,
    );
  }
}
