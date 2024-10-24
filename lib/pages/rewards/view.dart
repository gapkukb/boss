import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import '../../build_gen/assets.gen.dart';
import '../../widgets/boss_card.dart';
import '../../widgets/boss_gutter.dart';
import '../../widgets/boss_icon.dart';
import '../../widgets/boss_text.dart';
import 'index.dart';

class RewardsPage extends GetView<RewardsController> {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RewardsController>(
      init: RewardsController(),
      id: "rewards",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("rewards")),
          body: SafeArea(
            child: ListView.separated(
              padding: EdgeInsets.only(
                left: BossGutter.SMALL,
                right: BossGutter.SMALL,
                bottom: BossGutter.LARGE,
              ),
              itemCount: 100,
              separatorBuilder: (context, index) => SizedBox(
                height: BossGutter.SMALL,
              ),
              itemBuilder: (context, index) {
                if (index == 0) return _buildDailyCheckIn(context);
                if (index == 1) return _buildInvtation(context);
                return _Item();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildDailyCheckIn(BuildContext context) {
    return BossCard(
      titleText: "Daily Check-in",
      padding: EdgeInsets.all(BossGutter.MEDIUM),
      body: SizedBox(
        height: 180.r,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          separatorBuilder: (context, index) {
            return SizedBox(width: 8.r);
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 88.r,
                  height: 140.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1000.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Assets.images.loginMoodBoard.image(
                      cacheWidth: 64.r.toInt(),
                      cacheHeight: 64.r.toInt(),
                      fit: BoxFit.none,
                      color: Colors.blue,
                    ),
                  ),
                ),
                BossText(
                  "23 OCT",
                  fontSize: 24.sp,
                ),
              ],
            );
          },
        ),
      ),
      footer: GFButton(
        onPressed: () {},
        blockButton: true,
        fullWidthButton: true,
        text: "GET MONEY",
      ),
    );
  }

  Widget _buildInvtation(BuildContext context) {
    return BossCard(
      titleText: "Invite friends",
      padding: EdgeInsets.all(BossGutter.MEDIUM),
      body: Container(
        height: 200.r,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            image: Assets.images.userProfileBackgroundimage.image().image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.r,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: Assets.images.userProfileBackgroundimage.image().image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
