import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../build_gen/assets.gen.dart';
import '../../../extension/double.dart';
import '../../../widgets/index.dart';
import '../view.dart';
import 'card_with_title.dart';

class TopWinner extends StatelessWidget {
  const TopWinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWithTitle(
      height: 300.r,
      padding: EdgeInsets.only(
        left: 32.r,
        right: 32.r,
        top: 72.r,
        bottom: 0.r,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      title: Assets.images.userProfileBackgroundimage.image(
        width: 300.r,
        height: 48.r,
        color: Colors.green,
        fit: BoxFit.cover,
      ),
      titleOffset: Offset(0, -24.r),
      body: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.r,
          crossAxisSpacing: 10.r,
        ),
        children: [
          _TopWinnerItem(
            icon: Assets.images.loginMoodBoard.image().image,
            color: Colors.red,
            rankText: "TOP1",
            reward: 10000,
          ),
          _TopWinnerItem(
            icon: Assets.images.loginMoodBoard.image().image,
            color: Colors.orange,
            rankText: "TOP2",
            reward: 10000,
          ),
          _TopWinnerItem(
            icon: Assets.images.loginMoodBoard.image().image,
            color: Colors.cyan,
            rankText: "TOP3",
            reward: 10000,
          ),
        ],
      ),
    );
  }
}

class _TopWinnerItem extends StatelessWidget {
  final String rankText;
  final double reward;
  final Color color;
  final ImageProvider icon;

  const _TopWinnerItem({
    super.key,
    required this.rankText,
    required this.reward,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0, -24.r),
            child: ClipOval(
              child: Image(
                image: icon,
                width: 64.r,
                height: 64.r,
                fit: BoxFit.cover,
              ),
            ),
          ),
          BossText(
            text: rankText,
            color: Colors.white.withOpacity(0.9),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: BossText(
              text: reward.amountalize,
              fontSize: 40.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
