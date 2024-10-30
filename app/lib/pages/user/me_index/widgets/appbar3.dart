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
  final double? avatarRadius;

  const TelegramAppBar(
    this.sc, {
    super.key,
    this.height,
    this.expandHeight,
    this.stretchHeight,
    this.titleGap,
    this.backIconSize,
    this.avatarRadius,
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
        backIconSize: widget.backIconSize ?? 50.r,
        minAvatarRadius: widget.avatarRadius ?? 80.r,
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
  static final minAvatarLeft = 40.r;
  static final maxAvatarRadius = 120.r;

  final AnimationController controller;
  final double height;
  final double expandHeight;
  final double stretchHeight;
  final double backIconSize;
  final double minAvatarRadius;
  final double statusBarHeight;

  _TelegramAppBarDelegate({
    required this.controller,
    required this.height,
    required this.expandHeight,
    required this.stretchHeight,
    required this.backIconSize,
    required this.minAvatarRadius,
    required this.statusBarHeight,
  });

  late final _extent = this.height + this.expandHeight;
  late final _maxExtent = this._extent + this.stretchHeight;
  late final expandPercent = (this.height + this.expandHeight) / _maxExtent;
  late final maxAvatarLeft = 64.r;
  late final titleLeftGap = 24.r;
  late final avatarLeftPos = this.backIconSize + this.maxAvatarLeft;
  late final titleLeftPos = this.avatarLeftPos + this.minAvatarRadius + this.titleLeftGap;
  late final maxTop = this.height + this.expandHeight / 2 - this.minAvatarRadius;

  late final minTop = this.statusBarHeight + (this.height - this.statusBarHeight) / 2 - this.minAvatarRadius / 2;

  var offset = 0.0;
  var isExpanded = true;
  var isStretched = true;

  double get avatarRadius {
    return isExpanded ? maxAvatarRadius : minAvatarRadius;
  }

  double get avatarLeft {
    return isExpanded ? minAvatarLeft : maxAvatarLeft;
  }

  double get avatarTop {
    return maxTop;
  }

  double get titleLeft {
    return avatarLeft;
  }

  double get titleTop {
    return maxTop + 24.r;
  }

  double get process {
    return min(1, offset / expandHeight);
  }

  double get left {
    return minAvatarLeft + process * (maxAvatarLeft - minAvatarLeft + 40.r);
  }

  double get top {
    return minTop + (1 - process) * (maxTop - minTop);
  }

  double get radius {
    return minAvatarRadius + (1 - process) * (maxAvatarRadius - minAvatarRadius);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    offset = shrinkOffset;

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
      height: _maxExtent,
      child: Stack(
        children: [
          // 头像
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              print("controller.value: ${controller.value}");
              return Positioned(
                top: top,
                left: left,
                width: radius,
                height: radius,
                child: child!,
              );
            },
            child: AnimatedPhysicalModel(
              duration: Duration(milliseconds: 100),
              curve: Curves.linear,
              borderRadius: BorderRadius.circular(isStretched ? avatarRadius : avatarRadius),
              color: Colors.green,
              shadowColor: Colors.green,
              clipBehavior: Clip.antiAlias,
              child: Assets.images.userProfileBackgroundimage.image(
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 用户名
          Positioned(
            top: top,
            left: titleLeftPos,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "尼古拉斯.赵四",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38.r,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Text(
                  "online",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 30.r,
                    // height: 1,
                  ),
                ),
              ],
            ),
          ),
          _buildActions(),
        ],
      ),
    );
  }

  _buildActions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: statusBarHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: ArrowIcon.Left(
                size: backIconSize,
                color: Colors.white,
              ),
            ),
            Spacer(),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.qr_code,
            //     color: Colors.white,
            //   ),
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => _extent;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
