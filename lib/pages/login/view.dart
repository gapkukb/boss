import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../../widgets/scroll_column_expandable.dart';
import '../../widgets/x_divider.dart';
import '../../widgets/x_phone_textfield.dart';
import 'index.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import '../../build_gen/assets.gen.dart';

import 'widgets/protocol.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  // 主视图
  List<Widget> _buildView() {
    return [
      /**
        XPhoneTextfield(),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            child: Text("登录/注册"),
          ),
        ),
         */

      TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          // prefixIcon: ,
          hintText: "手机号/邮箱/用户名",
        ),
      ),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: "请输入密码",
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {},
          child: Text(
            '忘记密码',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () {},
          child: Text("登录"),
        ),
      ),
      Spacer(),
      XDivider(
        text: 'OR',
        textColor: Colors.black,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
      Protocol()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          body: ScrollColumnExpandable(
            padding: EdgeInsets.only(
              top: 250.0,
              left: 16.0,
              right: 16.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: Assets.images.loginMoodBoard.image().image,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            children: _buildView(),
          ),
        );
      },
    );
  }
}
