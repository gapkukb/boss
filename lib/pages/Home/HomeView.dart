import 'package:boss/pages/Home/HomeViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<SplashViewController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashViewController());

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
