import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MeIndexController extends GetxController with GetSingleTickerProviderStateMixin {
  static const double _maxOffset = 60;
  static const double _minOffset = 16;
  static const double expanedHeight = 140;
  static const double strechHeight = 100;
  static const double topOffset = -30;
  late final animation;

  MeIndexController();
  final offset = 0.0.obs;
  final realExpanedheight = (expanedHeight).obs;
  final strechOffset = (strechHeight / 2).obs;
  final sc = ScrollController();
  bool _expanded = false;

  double get titleOffset {
    if (offset.value < _minOffset) return _minOffset;
    if (offset.value > _maxOffset) return _maxOffset;
    return offset.value;
  }

  double get avatarScale {
    if (offset.value >= 0) return 1;
    final delta = max(topOffset, offset.value);
    // print(delta);
    return 1 + delta / (topOffset * 3);
  }

  bool get collapseable {
    return _expanded && sc.offset > strechHeight / 2;
  }

  bool get expanedable {
    return !_expanded && sc.offset < -strechHeight / 2;
  }

  void _onScrolling() {
    offset.value = sc.offset;
    if (expanedable) {
    } else if (collapseable) {}
  }

  Future _expand() async {
    await sc.animateTo(-strechHeight, duration: Duration(milliseconds: 200), curve: Curves.linear);
    realExpanedheight.value = expanedHeight + strechHeight;
    sc.jumpTo(0);
    _expanded = true;
  }

  Future _collapse() async {
    await sc.animateTo(strechHeight, duration: Duration(milliseconds: 200), curve: Curves.linear);
    realExpanedheight.value = expanedHeight;
    sc.jumpTo(0);
    _expanded = false;
  }

  void onPointerUp(PointerUpEvent event) async {
    // if (expanedable) {
    //   _expand();
    // } else if (collapseable) {
    //   _collapse();
    // } else if (_expanded) {
    //   sc.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.linear);
    // }
  }

  @override
  void onInit() {
    super.onInit();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void onReady() {
    super.onReady();
    sc.addListener(_onScrolling);
  }

  @override
  void onClose() {
    sc.removeListener(_onScrolling);
    sc.dispose();
    super.onClose();
  }

  Future onStretchTrigger() async {
    print('trigger');
  }
}
