import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';

import '../../../../build_gen/assets.gen.dart';
import '../../../../widgets/ArrowIcon.dart';

const double maxHeaderExtent = 250.0;
const double minHeaderExtent = 56.0;
const double titleGap = 16;
const double backIconSize = 44 + 8;
const double avatarSize = 44;
const double precent = 0.2;

class TelegramAppBar extends StatefulWidget {
  const TelegramAppBar({super.key});

  @override
  State<TelegramAppBar> createState() => _TelegramAppBarState();
}

class _TelegramAppBarState extends State<TelegramAppBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _TelegramAppbarDelegate(controller: _controller),
      pinned: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _TelegramAppbarDelegate extends SliverPersistentHeaderDelegate {
  final AnimationController controller;
  var zoomed = true;
  Duration _duration = Duration(milliseconds: 0);

  _TelegramAppbarDelegate({
    required this.controller,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double width = MediaQuery.of(context).size.width;
    final double top = max(maxHeaderExtent - shrinkOffset - minHeaderExtent - 40, 5);
    final double process = shrinkOffset / maxHeaderExtent;

    final double size = max(avatarSize * 2 * (1 - process), avatarSize);

    if (zoomed && process > precent) {
      zoomed = false;
      controller.reverse();
    } else if (!zoomed && process < precent) {
      zoomed = true;
      controller.forward();
    }

    print("shrinkOffset: $shrinkOffset     process: $process       zoomed: $zoomed");

    return Container(
      color: Colors.blue,
      height: maxHeaderExtent,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              print("controller.value: ${controller.value}");
              return Positioned(
                top: top * (1 - controller.value),
                left: backIconSize * (1 - controller.value),
                width: max(width * controller.value, avatarSize),
                height: max(width * controller.value, avatarSize),
                child: AnimatedPhysicalModel(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                  borderRadius: BorderRadius.circular(size),
                  color: Colors.green,
                  shadowColor: Colors.green,
                  clipBehavior: Clip.antiAlias,
                  child: Assets.images.userProfileBackgroundimage.image(
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: (top + (size - avatarSize) / 2) * (1 - controller.value),
            left: backIconSize + size + titleGap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("尼古拉斯.赵四"),
                Text("online"),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: ArrowIcon.Left()),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Iconify(Ion.ios_search)),
                  IconButton(onPressed: () {}, icon: Iconify(Ion.ios_search)),
                  IconButton(onPressed: () {}, icon: Iconify(Ion.ios_search)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxHeaderExtent;

  @override
  double get minExtent => minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
