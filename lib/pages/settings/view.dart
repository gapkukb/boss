import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'index.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SettingsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      id: "settings",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("settings")),
          body: SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Text("GroupName"),
                    ListView(
                      shrinkWrap: true,
                      itemExtent: 88.r,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0,
                          leading: Icon(Icons.settings),
                          horizontalTitleGap: 0,
                          title: Text(
                            '设置',
                            style: TextStyle(
                              fontSize: 28.r,
                              height: 3,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0,
                          leading: Icon(Icons.settings),
                          horizontalTitleGap: 0,
                          title: Text(
                            '设置',
                            style: TextStyle(
                              fontSize: 28.r,
                              height: 3,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0,
                          leading: Icon(Icons.settings),
                          horizontalTitleGap: 0,
                          title: Text(
                            '设置',
                            style: TextStyle(
                              fontSize: 28.r,
                              height: 3,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
