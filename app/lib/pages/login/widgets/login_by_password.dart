import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/boss_gutter.dart';
import '../../../widgets/boss_textfield.dart';
import '../index.dart';

class LoginByPassword extends GetView<LoginController> {
  const LoginByPassword({
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
          hintText: 'Phone / Email / Account',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.phone_android,
            size: 48.r,
          ),
        ),
        BossGutter.large(),
        BossTextfield(
          enabled: true,
          obscureable: true,
          hintText: 'Enter your password',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.lock_open_rounded,
            size: 48.r,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Text(
                'Forgot your password ?',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.sp,
                ),
              ),
            ),
          ),
        ),
        GFButton(
          onPressed: null,
          text: 'SIGN IN',
          blockButton: true,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.white,
        ),
        GFButton(
          onPressed: () {
            controller.isViaPhone.value = true;
          },
          text: "Sign in/up with verification code",
          type: GFButtonType.transparent,
        ),
      ],
    );
  }
}
