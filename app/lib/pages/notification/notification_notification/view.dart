import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'index.dart';

class NotificationNotificationPage extends GetView<NotificationNotificationController> {
  const NotificationNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationNotificationController>(
      init: NotificationNotificationController(),
      id: "notification_notification",
      builder: (_) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 32.r),
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
        );
      },
    );
  }
}
