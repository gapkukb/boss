import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/home_appbar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return DefaultTabController(
          length: controller.tabs.length,
          initialIndex: controller.initialIndex.value,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                HomeAppbar(tabs: controller.tabs),
                SliverFillRemaining(
                  child: TabBarView(
                    children: controller.tabs.map((tab) => tab.view).toList(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
