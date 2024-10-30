import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/boss_text.dart';
import 'index.dart';

class NotificationMessagePage extends GetView<NotificationMessageController> {
  const NotificationMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationMessageController>(
      init: NotificationMessageController(),
      id: "notification_message",
      builder: (_) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 32.r),
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Color(0xff98A8B8),
                radius: 48.r,
              ),
              title: BossText("Tanbir Ahmed"),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.r),
                child: Text("Hello po!", style: TextStyle(color: Color(0xff9C9BA6))),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BossText(
                    "12:37",
                    color: Colors.grey,
                    fontSize: 24.r,
                    fontWeight: FontWeight.w600,
                  ),
                  Badge(label: Text('199'), backgroundColor: Color(0xffFF7622)),
                ],
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
