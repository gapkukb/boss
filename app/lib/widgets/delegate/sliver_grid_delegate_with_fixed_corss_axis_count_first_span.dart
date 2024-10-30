import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SliverGridDelegateWithFixedCrossAxisCountFirstSpan extends SliverGridDelegateWithFixedCrossAxisCount {
  final int rowspan;
  final int colspan;

  SliverGridDelegateWithFixedCrossAxisCountFirstSpan({
    required super.crossAxisCount,
    super.crossAxisSpacing,
    super.mainAxisSpacing,
    super.mainAxisExtent,
    super.childAspectRatio,
    this.colspan = 1,
    this.rowspan = 1,
  });

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    if (rowspan <= 1 && colspan <= 1) {
      return super.getLayout(constraints);
    }

    final double usableCrossAxisExtent = math.max(
      0.0,
      constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = mainAxisExtent ?? childCrossAxisExtent / childAspectRatio;

    return _Layout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
      rowspan: rowspan,
      colspan: math.min(colspan, crossAxisCount),
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
    );
  }
}

class _Layout extends SliverGridRegularTileLayout {
  final int rowspan;
  final int colspan;
  final int target;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  _Layout({
    required super.crossAxisCount,
    required super.mainAxisStride,
    required super.crossAxisStride,
    required super.childMainAxisExtent,
    required super.childCrossAxisExtent,
    required super.reverseCrossAxis,
    required this.colspan,
    required this.rowspan,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    this.target = 0,
  });

  @override
  double _getOffsetFromStartInCrossAxis(double crossAxisStart) {
    if (reverseCrossAxis) {
      return crossAxisCount * crossAxisStride - crossAxisStart - childCrossAxisExtent - (crossAxisStride - childCrossAxisExtent);
    }
    return crossAxisStart;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final rawIndex = index;
    // colspan: 3,
    // rowspan: 4,
    // 每增加一行，index增加的3
    // if (rawIndex == 0) {
    //   index += 0;
    // } else if (rawIndex == 1) {
    //   index += 2;
    // } else if (rawIndex == 2) {
    //   index += 5;
    // } else if (rawIndex == 3) {
    //   index += 8;
    // } else {
    //   index += 11;
    // }

    //colspan: 2,
    //rowspan: 3,

    // if (rawIndex == 0) {
    //   index = 0;
    // } else if (rawIndex == 1) {
    //   index = 2;
    // } else if (rawIndex == 2) {
    //   index = 3;
    // } else if (rawIndex == 3) {
    //   index = 6;
    // } else if (rawIndex == 4) {
    //   index = 7;
    // } else if (rawIndex == 5) {
    //   index = 10;
    // } else if (rawIndex == 6) {
    //   index = 11;
    // } else {
    //   index += 5;
    // }

    final remaning = rowspan * crossAxisCount - rowspan * colspan;

    if (rawIndex == 0) {
      index = 0;
    } else if (rawIndex <= remaning) {
      // 每一行的偏移量
      final colOffset = rawIndex ~/ crossAxisCount;
      index = colOffset * rawIndex;
      print("$rawIndex,$index");
    }

    final double crossAxisStart = (index % crossAxisCount) * crossAxisStride;

    return SliverGridGeometry(
      scrollOffset: (index ~/ crossAxisCount) * mainAxisStride, // 主轴偏移量
      crossAxisOffset: _getOffsetFromStartInCrossAxis(crossAxisStart), // 交叉轴 偏移量
      mainAxisExtent: rawIndex == 0 ? mainAxisStride * rowspan - mainAxisSpacing : childMainAxisExtent,
      crossAxisExtent: rawIndex == 0 ? crossAxisStride * colspan - crossAxisSpacing : childCrossAxisExtent,
    );
  }
}
