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
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            controller: controller.scrollerController,
            slivers: [
              SliverAppBar.medium(
                backgroundColor: Colors.blue,
                stretch: true,
                stretchTriggerOffset: 10,
                onStretchTrigger: () async {
                  print("onStretchTrigger");
                },
                iconTheme: IconThemeData(color: Colors.white),
                expandedHeight: 140,
                floating: true,
                // snap: true,
                pinned: true,
                centerTitle: true,
                actions: [
                  Obx(
                    () => AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return MatrixTransition(
                          animation: animation,
                          filterQuality: FilterQuality.medium,
                          onTransform: (animationValue) {
                            return Matrix4.rotationX((1 - animationValue) * (180 / pi));
                          },
                          child: child,
                        );
                      },
                      child: controller.offset.value > 40
                          ? nil
                          : IconButton(
                              icon: Icon(Icons.qr_code),
                              onPressed: () {},
                            ),
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
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  // stretchModes: [
                  //   StretchMode.zoomBackground,
                  //   StretchMode.fadeTitle,
                  //   StretchMode.blurBackground,
                  // ],
                  expandedTitleScale: 1.05,
                  // centerTitle: true,
                  collapseMode: CollapseMode.pin,
                  titlePadding: EdgeInsets.only(left: 16),
                  // centerTitle: true,
                  title: ListTile(
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: 64,
                    leading: CircleAvatar(
                      backgroundImage: Assets.images.changePasswrodOk.image().image,
                    ),
                    title: Text("尼古拉斯.赵四", style: TextStyle(fontSize: 16)),
                    subtitle: Text("online", style: TextStyle(fontSize: 12)),
                  ),
                  background: Assets.images.userProfileBackgroundimage.image(
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.center,
                  heightFactor: 0,
                  child: SizedBox.square(
                    dimension: 64,
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 64,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 1000,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class A extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    Get.put(MeIndexController());

    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}
