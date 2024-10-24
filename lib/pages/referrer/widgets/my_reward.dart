import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import '../../../build_gen/assets.gen.dart';
import '../../../widgets/index.dart';
import 'card_with_title.dart';

class MyReward extends StatelessWidget {
  const MyReward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardWithTitle(
        height: 350.r,
        padding: EdgeInsets.only(
          left: 32.r,
          right: 32.r,
          top: 32.r,
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Assets.images.userProfileBackgroundimage.image(
                  width: 48.r,
                  height: 48.r,
                  fit: BoxFit.cover,
                ),
              ),
              title: BossText("我的邀请(0)"),
              subtitle: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Stack(
                  children: [
                    LinearProgressIndicator(
                      value: 0.5,
                      minHeight: 24.r,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      backgroundColor: Colors.grey.shade100,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: BossText(
                        "MY: 50%",
                        fontSize: 16.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GFButton(
              blockButton: true,
              text: "INVITE NOW",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 200.h,
                        padding: EdgeInsets.all(48.r),
                        child: Text("data"),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ));
  }
}
