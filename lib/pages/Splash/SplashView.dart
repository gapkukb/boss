import 'package:boss/pages/Home/HomeViewController.dart';
import 'package:boss/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../api/index.dart';

class SplashView extends GetView<SplashViewController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashViewController());
    queryMima({
      "ss_sz": 1,
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashView'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            EasyLoading.showToast('loading...');
            // Get.toNamed(Routes.HOME);
          },
          child: const Text('SplashView'),
        ),
      ),
    );
  }
}
