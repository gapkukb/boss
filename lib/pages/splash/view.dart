import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import '../../build_gen/assets.gen.dart';
import '../../widgets/boss_gutter.dart';
import 'index.dart';

class _Indicator extends AnimatedContainer {
  final bool isActive;

  _Indicator({
    required this.isActive,
  }) : super(
            height: 20.r,
            duration: Duration(milliseconds: 300),
            width: isActive ? 48.r : 20.r,
            decoration: BoxDecoration(
              color: isActive ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(100.r),
            ));
}

class _Button extends StatelessWidget {
  final bool hidden;
  final String text;
  final void Function()? onPressed;
  const _Button({
    Key? key,
    required this.text,
    this.hidden = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: hidden ? 0 : 1,
      child: GFButton(
        type: GFButtonType.transparent,
        color: Color(0xffF83758),
        text: text,
        onPressed: onPressed,
      ),
    );
  }
}

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: controller.onSkip,
                child: Text("Skip"),
              ),
            ],
          ),
          body: Stack(
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.current.value = value;
                },
                children: [
                  _buildItem(
                    Assets.images.splash.a1.image(
                      width: double.infinity,
                    ),
                    "Choose Products",
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                  ),
                  _buildItem(
                    Assets.images.splash.a2.image(
                      width: double.infinity,
                    ),
                    "Make Payment",
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                  ),
                  _buildItem(
                    Assets.images.splash.a3.image(
                      width: double.infinity,
                    ),
                    "Choose Products",
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 46.r),
                child: Obx(
                  () => Wrap(
                    spacing: 4.r,
                    children: [
                      for (var i = 0; i < 3; i++) _Indicator(isActive: controller.current.value == i),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _Button(
                        text: "Previous",
                        hidden: controller.current.value == 0,
                        onPressed: controller.onPrevious,
                      ),
                      _Button(
                        text: "Next",
                        hidden: controller.current.value == 2,
                        onPressed: controller.onNext,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(Image image, String title, String description) {
    return Container(
      padding: EdgeInsets.only(bottom: 46.r, left: 32.r, right: 32.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.r),
            child: image,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 48.r,
              fontWeight: FontWeight.w900,
            ),
          ),
          BossGutter.small(),
          Text(
            description,
            style: TextStyle(
              fontSize: 28.r,
              color: Color(0xffA8A8A8),
            ),
          ),
        ],
      ),
    );
  }
}
