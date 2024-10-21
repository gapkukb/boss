import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../../widgets/boss_scroll_column_expandable.dart';
import '../../widgets/boss_divider.dart';
import '../../widgets/boss_phone_textfield.dart';
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
            child: SingleChildScrollView(
              child: Column(
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(10.r, 10.r),
                          blurRadius: 20.r,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            focusColor: Colors.transparent,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.r,
                              ),
                            ),
                          ),
                        ),
                        TextField(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Text(
                          'Forgot your password ?',
                          style: TextStyle(
                            color: Color(0xffCACACA),
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
                  BossDivider(
                    text: 'OR',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
