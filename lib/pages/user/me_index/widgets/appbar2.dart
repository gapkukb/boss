import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double leftPadding = 20.0;
const double initialScrollOffset = 250.0;
const double scrollDesiredPercent = 0.65;
const Duration duration = Duration(milliseconds: 100);

class Appbar2 extends StatefulWidget {
  const Appbar2({super.key});

  @override
  State<Appbar2> createState() => _Appbar2State();
}

class _Appbar2State extends State<Appbar2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController sc;

  bool get scrollStopped => sc.position.isScrollingNotifier.value;

  bool get mustExpand => sc.offset < initialScrollOffset * scrollDesiredPercent;

  bool get mustRetract => !mustExpand && sc.offset < initialScrollOffset;

  void aimateToMaxExtent() {
    sc.animateTo(
      50,
      duration: duration,
      curve: Curves.linear,
    );
  }

  void aimateToNormalExtent() {
    sc.animateTo(
      initialScrollOffset,
      duration: duration,
      curve: Curves.linear,
    );
  }

  void handleScrolling() {
    if (scrollStopped) {
      if (mustExpand) {
        aimateToMaxExtent();
      } else if (mustRetract) {
        aimateToNormalExtent();
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sc = ScrollController(initialScrollOffset: initialScrollOffset);
      sc.position.isScrollingNotifier.addListener(handleScrolling);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: sc,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentProfileHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(index.toString()),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

const double maxHeaderExtent = 400.0;
const double minHeaderExtent = 80.0;

const double avatarRadius = 30;
const double minAvatarRadius = 20;
const double maxAvatarRadius = 50;

const double minLeftOffset = 20;
const double maxleftOffset = 80;

const double minTopOffset = 8;
const double maxTopOffset = 50;

const double minFontSize = 16;
const double maxFontSize = 18;

class PersistentProfileHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final paddingTop = MediaQuery.of(context).padding.top;
    double percent = (shrinkOffset - initialScrollOffset) / (maxExtent - initialScrollOffset - paddingTop - 60);

    double radius = avatarRadius * (1 - percent);
    radius = radius.clamp(minAvatarRadius, maxAvatarRadius);

    double leftOffset = maxleftOffset * 1.3 * percent;
    leftOffset = leftOffset.clamp(minLeftOffset, maxleftOffset);

    double topOffset = maxTopOffset * (1 - percent);
    topOffset = topOffset.clamp(minTopOffset, maxTopOffset);

    double fontSize = maxFontSize * 3 * (1 - percent);
    fontSize = fontSize.clamp(minFontSize, maxFontSize);

    bool mustExpand = shrinkOffset < initialScrollOffset * scrollDesiredPercent;

    return Container(
      color: Colors.grey[900],
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: duration,
            top: mustExpand ? 0 : paddingTop + topOffset,
            left: mustExpand ? 0 : leftOffset,
            child: AnimatedContainer(
              duration: duration,
              height: mustExpand ? maxExtent - shrinkOffset : 2 * radius,
              width: mustExpand ? MediaQuery.of(context).size.width : 2 * radius,
              decoration: BoxDecoration(
                // color: Colors.red,
                shape: shrinkOffset < 160 ? BoxShape.rectangle : BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/profile_picture.jpg'),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            top: mustExpand
                ? (maxExtent - shrinkOffset) - 60
                : percent > 0.9
                    ? paddingTop + 8
                    : paddingTop + topOffset + radius / 2 - 7,
            left: mustExpand ? 10 : leftOffset + 2 * radius + 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  child: Text(
                    'Fábio Ximenes',
                  ),
                  style: TextStyle(
                    fontSize: mustExpand ? 24 : fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  duration: Duration(
                    milliseconds: 200,
                  ),
                ),
                SizedBox(height: 5),
                AnimatedDefaultTextStyle(
                  child: Text(
                    'Last seen recently',
                  ),
                  style: TextStyle(
                    color: mustExpand ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  duration: Duration(
                    milliseconds: 200,
                  ),
                ),
              ],
            ),
          ),
          ProfileHeaderWidget(paddingTop: paddingTop),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxHeaderExtent;

  @override
  double get minExtent => minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    Key? key,
    required this.paddingTop,
  }) : super(key: key);

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5 + paddingTop,
      left: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            Expanded(child: SizedBox()),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
