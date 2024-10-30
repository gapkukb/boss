import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/delegate/sliver_grid_delegate_with_fixed_corss_axis_count_first_span.dart';
import 'index.dart';
import 'widgets/all_game.dart';
import 'widgets/hot.dart';
import 'widgets/slider.dart';
import 'dart:math' as math;

class SlotGamePage extends GetView<SlotGameController> {
  const SlotGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlotGameController>(
      init: SlotGameController(),
      id: "slot_game",
      builder: (_) {
        final gutter = 16.r;

        return Scaffold(
          appBar: AppBar(title: const Text("slot_game")),
          extendBody: false,
          body: SafeArea(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCountFirstSpan(
                crossAxisCount: 4,
                crossAxisSpacing: 8.r,
                mainAxisSpacing: 8.r,
                colspan: 2,
                rowspan: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      'Item $index',
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
