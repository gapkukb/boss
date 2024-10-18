import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class LayoutBottomNavigator extends GetView<LayoutBottomNavigatorController> {
  const LayoutBottomNavigator({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("LayoutBottomNavigatorPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutBottomNavigatorController>(
      init: LayoutBottomNavigatorController(),
      id: "layout_bottom_navigator",
      builder: (_) {
        // 底部导航栏BottomNavigationBar
        return Obx(
          () => BottomNavigationBar(
            items: controller.items,
            currentIndex: controller.currentIndex.value,
            onTap: controller.onTap,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
          ),
        );
      },
    );
  }
}
