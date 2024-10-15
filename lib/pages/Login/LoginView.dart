import 'package:flutter/material.dart';
import 'package:boss/pages/Login/LoginViewController.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/home');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
