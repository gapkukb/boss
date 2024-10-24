import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/index.dart';
import '../slot_game/widgets/slider.dart';
import '../../build_gen/assets.gen.dart';
import 'index.dart';
import 'widgets/description.dart';
import 'widgets/my_reward.dart';
import 'widgets/rule.dart';
import 'widgets/top_winner.dart';

/** 推广/邀请好友 */
class ReferrerPage extends GetView<ReferrerController> {
  const ReferrerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferrerController>(
      init: ReferrerController(),
      id: "referrer",
      builder: (_) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: BossGutter.LARGE,
              left: BossGutter.MEDIUM,
              right: BossGutter.MEDIUM,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.userProfileBackgroundimage.image().image,
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
              ),
            ),
            child: SafeArea(
              child: ListView(
                children: [
                  VerticalMarquee(),
                  BossGutter.large(),
                  MyReward(),
                  BossGutter.large(),
                  TopWinner(),
                  BossGutter.large(),
                  Rule(),
                  BossGutter.large(),
                  Description(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
