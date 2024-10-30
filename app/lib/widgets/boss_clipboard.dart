import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../global/global.dart';
import 'boss_icon.dart';

class BossClipboard extends StatelessWidget {
  final Widget? child;
  final dynamic content;
  const BossClipboard(
    this.content, {
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copy,
      child: child ?? BossIcon(Icons.copy),
    );
  }

  Future _copy() async {
    try {
      await FlutterClipboard.copy(content.toString());
      Global.toast('Copied successfully!');
    } catch (e) {
      Global.toast('Copied failed!');
    }
  }
}
