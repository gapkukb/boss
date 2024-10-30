import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../build_gen/assets.gen.dart';
import '../../../widgets/boss_cell.dart';
import '../../../widgets/boss_clipboard.dart';
import '../../../widgets/boss_image_picker.dart';
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
                      titleWidget: BossText("Avatar"),
                      valueWidget: BossImagePicker(
                        child: CircleAvatar(
                          child: Assets.images.changePasswrodOk.image(),
                        ),
                      ),
                    ),
                  ],
                ),
                BossCellGroup(
                  children: [
                    BossCell(
                      titleWidget: BossText("Nickname"),
                      valueWidget: BossText("PlayIFBo9"),
                      onTap: () {
                        // controller.toUserDetail();
                      },
                    ),
                    BossCell(
                      titleText: "User ID",
                      valueText: "PlayIFBo9",
                      extra: BossClipboard("PlayIFBo9"),
                      onTap: () {
                        // controller.toUserDetail();
                      },
                    ),
                  ],
                ),
                BossCellGroup(
                  children: [
                    BossCell(
                      leading: ImageIcon(Assets.images.changePasswrodOk.image().image),
                      titleText: "移动网络",
                      valueText: "已开启",
                      onTap: () {
                        // controller.toUserDetail();
                      },
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
