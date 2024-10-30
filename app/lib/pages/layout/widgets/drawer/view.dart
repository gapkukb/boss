import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import '../../../../build_gen/assets.gen.dart';
import 'index.dart';

class LayoutDrawer extends GetView<LayoutDrawerController> {
  const LayoutDrawer({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("UserDrawerPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutDrawerController>(
      init: LayoutDrawerController(),
      id: "user_drawer",
      builder: (_) {
        return Obx(
          () => Drawer(
            width: controller.width.value,
            shape: RoundedRectangleBorder(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                    // padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: Assets.images.userProfileBackgroundimage.image().image,
                        fit: BoxFit.cover,
                        opacity: 0.8,
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade500,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GFAvatar(
                                backgroundImage: Assets.images.loginMoodBoard.image().image,
                              ),
                            ),
                          ),
                          title: const Text(
                            '云青涩..',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          subtitle: const Text(
                            '这个人很懒，什么也没留下',
                            style: TextStyle(fontSize: 12, color: Colors.white54),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GFButton(
                              text: "充值",
                              size: GFSize.SMALL,
                              onPressed: () {},
                            ),
                            GFButton(
                              text: "提现",
                              color: Colors.cyan,
                              size: GFSize.SMALL,
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    )),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                Spacer(),
                ListTile(
                  dense: true,
                  title: const Text('黑夜模式'),
                  //trailing: const Icon(Icons.light_mode),
                  trailing: const Icon(Icons.dark_mode),
                  onTap: () {},
                ),
                GFButton(
                  fullWidthButton: true,
                  color: Colors.red,
                  text: "登出",
                  blockButton: true,
                  size: GFSize.SMALL,
                  onPressed: () {},
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
