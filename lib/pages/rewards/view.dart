import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../build_gen/assets.gen.dart';
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
            child: ListView(
              children: [
                _buildDailyCheckIn(context),
                // ElevatedButton(
                //   onPressed: () => controller.increment
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDailyCheckIn(BuildContext context) {
    return Card.outlined(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Daily Check-in"),
          SizedBox(
            height: 100,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: BossGutter.SMALL,
                vertical: BossGutter.SMALL,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 100,
              // shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(width: 8.r);
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 94.r,
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
                      text: "23 OCT",
                      fontSize: 24.sp,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
