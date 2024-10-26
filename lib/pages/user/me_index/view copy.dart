import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nil/nil.dart';

import '../../../build_gen/assets.gen.dart';
import 'index.dart';

class MeIndexPage extends GetView<MeIndexController> {
  const MeIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeIndexController>(
      init: MeIndexController(),
      id: "me_index",
      builder: (_) {
        return Scaffold(
          body: Listener(
            // behavior: HitTestBehavior.opaque,
            // onPointerUp: controller.onPointerUp,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              controller: controller.sc,
              slivers: [
                Obx(
                  () => SliverAppBar.medium(
                    backgroundColor: Colors.blue,
                    stretch: true,
                    iconTheme: IconThemeData(color: Colors.white),
                    // expandedHeight: controller.realExpanedheight.value,
                    stretchTriggerOffset: controller.strechOffset.value,
                    onStretchTrigger: controller.onStretchTrigger,
                    // floating: true,
                    // snap: true,
                    pinned: true,
                    // centerTitle: true,
                    actions: [
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                          );
                        },
                        child: controller.offset.value > 50
                            ? nil
                            : IconButton(
                                icon: Icon(Icons.qr_code),
                                onPressed: () {},
                              ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ],

                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: [
                        StretchMode.zoomBackground,
                        // StretchMode.fadeTitle,
                        // StretchMode.blurBackground,
                      ],
                      expandedTitleScale: 1.05,
                      collapseMode: CollapseMode.pin,
                      titlePadding: EdgeInsets.only(left: controller.titleOffset),
                      title: ListTile(
                        contentPadding: EdgeInsets.zero,
                        minTileHeight: 64,
                        minLeadingWidth: 40 * controller.avatarScale,
                        leading: UnconstrainedBox(
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            backgroundImage: Assets.images.changePasswrodOk.image().image,
                            radius: 20 * controller.avatarScale,
                          ),
                        ),
                        title: Text("尼古拉斯.赵四", style: TextStyle(fontSize: 16)),
                        subtitle: Text("online", style: TextStyle(fontSize: 12)),
                      ),
                      background: Assets.images.userProfileBackgroundimage.image(
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverList.separated(
                  itemBuilder: (context, index) {
                    // return SizedBox(
                    //   height: 100,
                    // );
                    return ListTile(
                      title: Text(
                        index.toString(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
