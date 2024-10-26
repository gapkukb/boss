import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nil/nil.dart';

import '../../../build_gen/assets.gen.dart';
import 'index.dart';
import 'widgets/appbar3.dart';

class MeIndexPage extends GetView<MeIndexController> {
  const MeIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeIndexController>(
      init: MeIndexController(),
      id: "me_index",
      builder: (_) {
        return Scaffold(
          body: Listener(
            // behavior: HitTestBehavior.opaque,
            // onPointerUp: controller.onPointerUp,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              controller: controller.sc,
              slivers: [
                TelegramAppBar(controller.sc),
                SliverList.separated(
                  itemBuilder: (context, index) {
                    // return SizedBox(
                    //   height: 100,
                    // );
                    return ListTile(
                      title: Text(
                        index.toString(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
