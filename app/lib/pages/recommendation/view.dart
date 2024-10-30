import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import '../../build_gen/assets.gen.dart';
import '../../widgets/boss_colored_box.dart';
import '../../widgets/boss_icon.dart';
import 'index.dart';

class _Dot extends BossColoredBox {
  final bool active;

  _Dot({
    Key? key,
    this.active = false,
  }) : super(key: key, color: active ? Colors.amber : Colors.white, size: 8.r);
}

class RecommendationPage extends GetView<RecommendationController> {
  const RecommendationPage({super.key});

  // 主视图
  Widget _buildSwiper() {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200.r,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  controller.current.value = index;
                },
              ),
              items: controller.slides
                  .map((slide) => Image.network(
                        'https://picsum.photos/200/300?random=$slide',
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ))
                  .toList()),
          // items: controller.slides.map((slide) => FlutterLogo()).toList()),
        ),
        Positioned(
          child: Obx(
            () => Wrap(
              spacing: 4.r,
              children: List.generate(
                controller.slides.length,
                (index) => _Dot(active: index == controller.current.value),
              ),
            ),
          ),
          right: 8.r,
          bottom: 8.r,
        ),
      ],
    );
  }

  Widget _buildCard() {
    return GFCard(
      height: 200.r,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      boxFit: BoxFit.cover,
      showImage: true,
      image: Assets.images.userProfileBackgroundimage.image(
        fit: BoxFit.cover,
        height: 100.r,
        width: double.infinity,
      ),

      title: GFListTile(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        // avatar: GFAvatar(
        //   size: 20,
        //   backgroundImage: Assets.images.loginMoodBoard.image().image,
        // ),
        title: SizedBox(
          height: 24.r,
          child: Text(
            '视频推给你是有原因的啊哥',
            maxLines: 2,
            style: TextStyle(
              fontSize: 12.r,
              height: 1,
            ),
          ),
        ),
      ),
      content: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading: BossIcon(
          Icons.live_tv,
        ),
        horizontalTitleGap: 0,
        title: Text(
          '延边刺客',
          style: TextStyle(
            fontSize: 10.r,
            height: 3,
          ),
        ),
        trailing: BossIcon(
          Icons.more_vert,
          onTap: () {},
        ),
      ),

      // buttonBar: GFButtonBar(
      //   children: [
      //     GFButton(
      //       onPressed: () {},
      //       text: 'Buy',
      //     ),
      //     GFButton(
      //       onPressed: () {},
      //       text: 'Cancel',
      //     ),
      //   ],
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendationController>(
      init: RecommendationController(),
      id: "recommendation",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                _buildSwiper(),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.99,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.r,
                    mainAxisSpacing: 8.r,
                  ),
                  children: [
                    _buildCard(),
                    _buildCard(),
                    _buildCard(),
                    _buildCard(),
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
