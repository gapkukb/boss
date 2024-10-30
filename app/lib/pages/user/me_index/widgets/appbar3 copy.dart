import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../build_gen/assets.gen.dart';
import '../../../../widgets/ArrowIcon.dart';

class TelegramAppBar extends StatefulWidget {
  final ScrollController sc;
  final double? height;
  final double? expandHeight;
  final double? stretchHeight;
  final double? titleGap;
  final double? backIconSize;
  final double? avatarSize;

  const TelegramAppBar(
    this.sc, {
    super.key,
    this.height,
    this.expandHeight,
    this.stretchHeight,
    this.titleGap,
    this.backIconSize,
    this.avatarSize,
  });

  @override
  State<TelegramAppBar> createState() => _TelegramAppBarState();
}

class _TelegramAppBarState extends State<TelegramAppBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return SliverPersistentHeader(
      pinned: true,
      delegate: _TelegramAppBarDelegate(
        controller: _controller,
        height: widget.height ?? 190.r,
        expandHeight: widget.expandHeight ?? 190.r,
        stretchHeight: widget.stretchHeight ?? 370.r,
        titleGap: widget.titleGap ?? 44.r,
        backIconSize: widget.backIconSize ?? 44.r,
        avatarSize: widget.avatarSize ?? 44.r,
        statusBarHeight: statusBarHeight,
      ),
    );
  }

  _handleScrolling() {
    print(widget.sc.position.pixels);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      widget.sc.position.isScrollingNotifier.addListener(_handleScrolling);
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}

class _TelegramAppBarDelegate extends SliverPersistentHeaderDelegate {
  final AnimationController controller;
  final double height;
  final double expandHeight;
  final double stretchHeight;
  final double titleGap;
  final double backIconSize;
  final double avatarSize;
  final double statusBarHeight;

  _TelegramAppBarDelegate({
    required this.controller,
    required this.height,
    required this.expandHeight,
    required this.stretchHeight,
    required this.titleGap,
    required this.backIconSize,
    required this.avatarSize,
    required this.statusBarHeight,
  });

  var isExpanded = true;
  var isStretched = true;
  late final maxHeaderExtent = this.height + this.expandHeight + this.stretchHeight;
  late final expandPercent = (this.height + this.expandHeight) / maxHeaderExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double width = MediaQuery.of(context).size.width;
    final double top = max(maxHeaderExtent - shrinkOffset - height - 40, 5);
    final double process = shrinkOffset / maxHeaderExtent;

    final double size = max(avatarSize * 2 * (1 - process), avatarSize);

    if (isStretched && process > expandPercent) {
      isStretched = false;
      controller.reverse();
    } else if (!isStretched && process < expandPercent) {
      isStretched = true;
      controller.forward();
    }

    print("shrinkOffset: $shrinkOffset     process: $process       zoomed: $isStretched");

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
                  child: child!);
            },
            child: AnimatedPhysicalModel(
              duration: Duration(milliseconds: 100),
              curve: Curves.linear,
              borderRadius: BorderRadius.circular(isStretched ? 0 : 100),
              color: Colors.green,
              shadowColor: Colors.green,
              clipBehavior: Clip.antiAlias,
              child: Assets.images.userProfileBackgroundimage.image(
                fit: BoxFit.cover,
              ),
            ),
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
          IconButtonTheme(
            data: IconButtonThemeData(
                style: IconButton.styleFrom(
              foregroundColor: Colors.white,
              iconSize: 48.r,
            )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: statusBarHeight),
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
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height + expandHeight;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
