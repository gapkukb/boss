import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/index.dart';
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
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    leadingWidth: 90.r,
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffECF0F4),
                      child: IconButton(
                        onPressed: () {},
                        icon: Iconify(
                          Ion.ios_arrow_left,
                        ),
                      ),
                    ),
                    title: BossText("Notifications"),
                    scrolledUnderElevation: 0,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(80.r),
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
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 32.r),
                    sliver: SliverList.separated(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 108.r,
                          // horizontalTitleGap: 0.0,
                          leading: CircleAvatar(
                            backgroundColor: Color(0xff98A8B8),
                            radius: 60.r,
                          ),
                          title: Text.rich(
                            style: TextStyle(height: 1),
                            TextSpan(
                              text: "Tanbir Ahmed",
                              children: [TextSpan(text: " Placed a new order", style: TextStyle(color: Color(0xff9C9BA6)))],
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 16.r),
                            child: Text("20 hours ago", style: TextStyle(color: Color(0xff9C9BA6))),
                          ),
                          trailing: PhysicalModel(
                            color: Color(0xff98A8B8),
                            borderRadius: BorderRadius.circular(20.r),
                            child: SizedBox.square(dimension: 108.r),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        height: 0,
                        thickness: 1.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
