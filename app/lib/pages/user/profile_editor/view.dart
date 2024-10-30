import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import '../../../build_gen/assets.gen.dart';
import '../../../widgets/boss_action_sheet.dart';
import '../../../widgets/boss_cell.dart';
import '../../../widgets/index.dart';
import 'index.dart';

class ProfileEditorPage extends GetView<ProfileEditorController> {
  const ProfileEditorPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ProfileEditorPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditorController>(
      init: ProfileEditorController(),
      id: "profile_editor",
      builder: (_) {
        return CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Colors.white,
            middle: Text("Edit Profile"),
            previousPageTitle: "Back",
            trailing: TextButton(
              onPressed: () {},
              child: Text("Done"),
            ),
          ),
          child: Material(
            color: Color(0xffeeeff4),
            child: BossScrollColumnExpandable(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  tileColor: Colors.white,
                  enabled: false,
                  leading: GestureDetector(
                    onTap: updateAvatar,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: Assets.images.changePasswrodOk.image().image,
                      radius: 64.r,
                      child: Material(
                        shape: CircleBorder(),
                        color: Colors.black38,
                        child: SizedBox.square(
                          dimension: 128.r,
                          child: BossIcon(
                            Icons.camera_alt,
                            fgcolor: Colors.white,
                            size: 108.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "First Name",
                    ),
                  ),
                  subtitle: TextField(
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      border: InputBorder.none,
                    ),
                  ),
                  onTap: () {},
                ),
                BossText(
                  "Enter your name and add an optional profile picture",
                  padding: EdgeInsets.only(left: 32.r),
                  style: Theme.of(context).textTheme.displaySmall!,
                ),
                BossGutter.large(),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Bio",
                  ),
                ),
                BossText(
                  "Any details such as age, occupation or city. Example: 23 y.o. designer from San Francisco.",
                  padding: EdgeInsets.only(left: 32.r),
                  style: Theme.of(context).textTheme.displaySmall!,
                ),
                BossGutter.large(),
                BossCellGroup(
                  children: [
                    BossCell(
                      tileColor: Colors.white,
                      titleText: "Change Number",
                      valueText: "+63 9054160106",
                      onTap: () {},
                    ),
                    BossCell(
                      tileColor: Colors.white,
                      titleText: "User Name",
                      valueText: "@JohnDoe",
                      onTap: () {},
                    ),
                  ],
                ),
                // Spacer(),
                // GFButton(
                //   blockButton: true,
                //   onPressed: () {},
                //   text: "Save Changes",
                //   size: GFSize.LARGE,
                // ),
                Spacer(),
                GFButton(
                  fullWidthButton: true,
                  color: Colors.red,
                  text: "Log Out",
                  size: GFSize.LARGE,
                  onPressed: () {},
                ),
                BossGutter.large(),
              ],
            ),
          ),
        );
      },
    );
  }

  void updateAvatar() async {
    final action = await Get.bottomSheet<String>(
      BossActionSheet(
        children: [
          BossActionSheetItem(
            id: '1',
            title: "Choose Photo",
            onTap: () {
              print('object');
            },
          ),
          BossActionSheetItem(
            id: '2',
            title: "Web Search",
            onTap: Get.back,
          ),
          BossActionSheetItem(
            id: '3',
            title: "View Photo",
            onTap: Get.back,
          ),
          BossActionSheetItem(
            id: '4',
            title: "Remove Photo",
            textColor: Colors.red,
            onTap: Get.back,
          ),
        ],
      ),
    );
  }
}
