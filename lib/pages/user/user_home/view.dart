import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../build_gen/assets.gen.dart';
import '../../../widgets/boss_cell.dart';
import '../../../widgets/boss_text.dart';
import 'index.dart';

class UserHomePage extends GetView<UserHomeController> {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHomeController>(
      init: UserHomeController(),
      id: "user_home",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(title: const Text("user_home")),
          body: SafeArea(
            child: ListView(
              children: [
                BossCellGroup(
                  children: [
                    BossCell(
                      tileColor: Colors.white,
                      title: BossText(text: "Avatar"),
                      value: CircleAvatar(
                        child: Assets.images.changePasswrodOk.image(),
                      ),
                      onTap: () {
                        // controller.toUserDetail();
                      },
                    ),
                    BossCell(
                      tileColor: Colors.white,
                      title: BossText(text: "Avatar"),
                      value: CircleAvatar(
                        child: Assets.images.changePasswrodOk.image(),
                      ),
                      onTap: () {
                        // controller.toUserDetail();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
