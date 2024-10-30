import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/pages.dart';
import 'index.dart';
import 'widgets/bottom_navigator/index.dart';
import 'widgets/drawer/index.dart';

class LayoutPage extends GetView<LayoutController> {
  const LayoutPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("LayoutPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      init: LayoutController(),
      id: "layout",
      builder: (_) {
        final LayoutBottomNavigatorController c = Get.find<LayoutBottomNavigatorController>();
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) {
                return Scaffold(
                  drawer: LayoutDrawer(),
                  body: Navigator(
                    key: Get.nestedKey(1),
                    initialRoute: AppPages.initalRoute,
                    onGenerateRoute: c.onGenerateRoute,
                  ),
                  bottomNavigationBar: LayoutBottomNavigator(),
                );
              },
            )
          ],
        );
      },
    );
  }
}
