import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../build_gen/assets.gen.dart';
import '../../../extension/double.dart';
import '../../../widgets/index.dart';
import '../view.dart';
import 'card_with_title.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWithTitle(
      // height: 250.r,
      padding: EdgeInsets.only(
        left: 32.r,
        right: 32.r,
        top: 72.r,
        bottom: 48.r,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2.r, 2.r),
            blurRadius: 2.r,
            // spreadRadius: 4.r,
          )
        ],
      ),
      title: Assets.images.userProfileBackgroundimage.image(
        width: 300.r,
        height: 48.r,
        color: Colors.green,
        fit: BoxFit.cover,
      ),
      titleOffset: Offset(0, -24.r),
      body: DefaultTextStyle(
        style: TextStyle(
          color: Colors.grey,
          height: 1.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BossText(text: "Every valid player = P100/No limit"),
            BossText(text: "Every valid player = P100/No limit"),
            BossText(text: "Every valid player = P100/No limit"),
            BossText(text: "Every valid player = P100/No limit"),
            BossText(text: "Every valid player = P100/No limit"),
            BossText(text: "Every valid player = P100/No limit"),
          ],
        ),
      ),
    );
  }
}
