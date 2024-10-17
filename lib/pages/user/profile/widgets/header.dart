import 'package:flutter/material.dart';

import '../../../../build_gen/assets.gen.dart';

class Header extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Assets.images.userProfileBackgroundimage.image(
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 240;

  @override
  // TODO: implement minExtent
  double get minExtent => 180;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
