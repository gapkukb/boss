import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/index.dart';
import '../notification_message/index.dart';
import '../notification_notification/index.dart';
import 'index.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("NotificationPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      id: "notification",
      builder: (_) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
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
                "Notifications",
                fontSize: 46.sp,
              ),
              scrolledUnderElevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.r),
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  dividerHeight: 1.r,
                  indicatorColor: Color(0xffFF7622),
                  labelColor: Color(0xffFF7622),
                  unselectedLabelColor: Color(0xff000000),
                  tabs: [
                    Tab(text: "Notifications", height: 66.r),
                    Tab(text: "Messages (3)", height: 66.r),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: TabBarView(
                children: [
                  NotificationNotificationPage(),
                  NotificationMessagePage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
