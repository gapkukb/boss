import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';

import '../../widgets/boss_icon.dart';
import '../../widgets/boss_text.dart';
import 'index.dart';

class ReviewsPage extends GetView<ReviewsController> {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewsController>(
      init: ReviewsController(),
      id: "reviews",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            // toolbarHeight: 88.r,
            leadingWidth: 120.r,
            leading: Padding(
              padding: EdgeInsets.only(left: 32.r),
              child: CircleAvatar(
                backgroundColor: Color(0xffECF0F4),
                child: IconButton(
                  onPressed: () {},
                  icon: Iconify(
                    Ion.ios_arrow_left,
                  ),
                ),
              ),
            ),
            title: BossText(
              "Reviews",
              fontSize: 46.sp,
            ),
            scrolledUnderElevation: 0,
          ),
          body: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 32.r),
            itemCount: 100,
            cacheExtent: 100.r,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                isThreeLine: true,
                minLeadingWidth: 108.r,
                horizontalTitleGap: 0.0,
                leading: CircleAvatar(
                  backgroundColor: Color(0xff98A8B8),
                  radius: 48.r,
                ),
                title: PhysicalModel(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.r),
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BossText(
                              "John Doe",
                              fontSize: 24.sp,
                              color: Colors.grey,
                            ),
                            BossIcon(
                              Icons.more_horiz,
                              onTap: () => _tapHandle(index),
                            ),
                          ],
                        ),
                        BossText(
                          "Great Food and Service",
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        RatingBar.builder(
                          itemSize: 24.r,
                          initialRating: 3,
                          minRating: 1,
                          allowHalfRating: true,
                          // itemCount: 5,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        BossText(
                          "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks. ",
                          fontSize: 24.sp,
                          color: Color(0xff98A8B8),
                        ),
                      ],
                    ),
                  ),
                ),
                subtitle: nil,
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 0.r),
          ),
        );
      },
    );
  }

  void _tapHandle(int index) {
    Get.bottomSheet(Container(
      height: 300.r,
      color: Colors.white,
    ));
  }
}
