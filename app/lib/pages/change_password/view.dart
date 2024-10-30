import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../build_gen/assets.gen.dart';
import '../../widgets/boss_result_view.dart';
import '../../widgets/boss_textfield.dart';
import '../../widgets/index.dart';
import 'index.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  Widget _buildResult() {
    return BossResultView(
      image: Assets.images.changePasswrodOk.image().image,
      title: "Change password successfully!",
      description: "You have successfully change password.Please use the new password when Sign in.",
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      id: "change_password",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Change Password'),
          ),
          body: Padding(
            padding: EdgeInsets.all(BossGutter.LARGE),
            child: Column(
              children: [
                BossTextfield(
                  prefixIcon: Icon(Icons.lock_outline),
                  obscureable: true,
                  hintText: 'Type your old password',
                ),
                BossGutter.large(),
                BossTextfield(
                  prefixIcon: Icon(Icons.lock_outline),
                  obscureable: true,
                  hintText: 'Type your new password',
                ),
                BossGutter.large(),
                BossTextfield(
                  prefixIcon: Icon(Icons.lock_outline),
                  obscureable: true,
                  hintText: 'Confirm your new password',
                ),
                BossGutter.large(),
                GFButton(
                  text: "Change Password",
                  blockButton: true,
                  size: GFSize.LARGE,
                  onPressed: () {},
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
