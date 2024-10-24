import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../build_gen/assets.gen.dart';
import '../../../widgets/index.dart';

class Hot extends StatelessWidget {
  const Hot({
    super.key,
    required this.gutter,
  });

  final double gutter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BossText(
          "HOT GAMES",
          textAlign: TextAlign.start,
          fontSize: 24.sp,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        BossGutter.small(),
        SizedBox(
          width: double.infinity,
          height: 200.r,
          child: ListView.builder(
            itemCount: 100,
            itemExtent: 200.r,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: gutter),
                child: GestureDetector(
                  onTap: () {},
                  child: PhysicalModel(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.r),
                    clipBehavior: Clip.antiAlias,
                    child: Assets.images.userProfileBackgroundimage.image(
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
