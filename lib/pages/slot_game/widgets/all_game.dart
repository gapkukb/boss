import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../build_gen/assets.gen.dart';
import '../../../widgets/index.dart';

class AllGame extends StatelessWidget {
  const AllGame({
    super.key,
    required this.gutter,
  });

  final double gutter;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(gutter),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 1.5,
        crossAxisSpacing: gutter,
        mainAxisSpacing: gutter,
        mainAxisExtent: 420.r,
      ),
      itemCount: 7,
      itemBuilder: (context, index) {
        return PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          clipBehavior: Clip.antiAlias,
          elevation: 4.r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.userProfileBackgroundimage.image(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300.r,
              ),
              BossGutter.small(),
              BossText.ellipsis(
                text: "FORTUNE SLOT GAME",
                textAlign: TextAlign.start,
                fontSize: 24.sp,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              BossGutter.small(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BossText(
                      text: "4.3K",
                      fontSize: 24.sp,
                    ),
                    BossIcon(
                      icon: Icons.favorite_border,
                      size: 48.sp,
                      onTap: () {
                        print("like");
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
