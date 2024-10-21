import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/boss_icon.dart';

class Option extends StatelessWidget {
  final String title;
  final dynamic icon;
  final Color? iconColor;
  const Option({
    Key? key,
    required this.title,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 8),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
      leading: BossIcon(
        icon: icon,
        color: iconColor,
      ),
      trailing: Iconify(
        Ic.baseline_arrow_forward_ios,
        size: 18,
      ),
    );
  }
}

final List<Option> groups = [
  Option(
    title: "WLAN",
    icon: Icons.wifi,
    iconColor: Colors.blue,
  ),
  Option(
    title: "蓝牙",
    icon: Icons.bluetooth,
    iconColor: Colors.amber,
  ),
  Option(
    title: "移动网络",
    icon: Icons.mobile_friendly,
    iconColor: Colors.blueGrey,
  ),
  Option(
    title: "更多链接",
    icon: Icons.link,
    iconColor: Colors.green,
  ),
  Option(
    title: "通知和状态栏",
    icon: Icons.notifications,
    iconColor: Colors.indigo,
  ),
  Option(
    title: "隐私",
    icon: Icons.privacy_tip,
    iconColor: Colors.red,
  ),
];
