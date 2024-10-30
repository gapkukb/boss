import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/boss_gutter.dart';
import '../../../widgets/boss_textfield.dart';
import '../index.dart';

class LoginByPhone extends GetView<LoginController> {
  const LoginByPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BossTextfield(
          enabled: true,
          hintText: 'Your phone number',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.phone_android,
            size: 48.r,
          ),
        ),
        BossGutter.large(),
        GFButton(
          onPressed: null,
          text: 'SIGN IN/UP',
          textStyle: TextStyle(),
          blockButton: true,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.white,
        ),
        GFButton(
          onPressed: () {
            controller.isViaPhone.value = false;
          },
          text: "Sign in by password",
          type: GFButtonType.transparent,
        ),
      ],
    );
  }
}
