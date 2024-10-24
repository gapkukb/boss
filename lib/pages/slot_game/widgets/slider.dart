import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';

import '../../../build_gen/assets.gen.dart';
import '../../../widgets/boss_border_box.dart';
import '../../../widgets/index.dart';

class VerticalMarquee extends StatelessWidget {
  const VerticalMarquee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(16.r),
      clipBehavior: Clip.antiAlias,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: 100.r,
          autoPlayInterval: Duration(seconds: 3),
          autoPlay: true,
          scrollDirection: Axis.vertical,
        ),
        itemBuilder: (context, index, realIndex) {
          return _SliderItem();
        },
      ),
    );
  }
}

class _SliderItem extends StatelessWidget {
  const _SliderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(BossGutter.MINI),
      child: Row(
        children: [
          Assets.images.userProfileBackgroundimage.image(
            width: 80.r,
            height: 60.r,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: BossText(
              "bi***W6v",
              fontSize: 24.sp,
            ),
          ),
          BossGutter.mini(),
          BossBorderBox(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: BossText(
              "Big Win",
              fontSize: 24.sp,
              color: Colors.red,
            ),
          ),
          BossGutter.mini(),
          BossText(
            "AM 10:26:02",
            fontSize: 24.sp,
            color: Colors.grey,
          ),
          Spacer(),
          BossText(
            "11,670",
            fontSize: 24.sp,
          ),
          BossIcon(icon: SimpleIcons.bitcoin),
        ],
      ),
    );
  }
}
