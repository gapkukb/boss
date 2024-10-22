import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:nil/nil.dart';
import '../../widgets/boss_scroll_column_expandable.dart';
import '../../widgets/boss_divider.dart';
import '../../widgets/boss_phone_textfield.dart';
import '../../widgets/boss_textfield.dart';
import '../../widgets/index.dart';
import 'index.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import '../../build_gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/protocol.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Color(0xff281C9D),
          appBar: AppBar(
            backgroundColor: Color(0xff281C9D),
            leadingWidth: 80.r,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Container(
            constraints: BoxConstraints(
              minWidth: context.width,
              minHeight: context.height - kToolbarHeight,
            ),
            padding: EdgeInsets.all(48.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: BossScrollColumnExpandable(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Color(0xff281C9D),
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hello there, sign in to continue',
                    style: TextStyle(
                      color: Color(0xff343434),
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                BossGutter.xlarge(),
                Assets.images.signInIcon.image(width: 426.r, height: 330.r),
                BossGutter.xlarge(),
                BossTextfield(
                  enabled: true,
                  hintText: 'Email',
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
                  text: 'Sign In',
                  blockButton: true,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.white,
                ),
                BossGutter.large(),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: BossDivider(
                    text: 'OR',
                    gap: 48.r,
                    fontSize: 28.r,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.fingerprint),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.facebook),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Iconify(Carbon.logo_google),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.apple),
                    ),
                  ],
                ),
                Spacer(),
                BossGutter.large(),
              ],
            ),
          ),
        );
      },
    );
  }
}
