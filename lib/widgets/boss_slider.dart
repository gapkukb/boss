import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BossSlider extends StatefulWidget {
  final CarouselOptions option;
  final List<Widget> items;
  final int initialIndex;
  final Widget Function(int index, bool active) indicatorBuilder;
  final double indicatorSpacing;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Color? bgcolor;
  final CarouselSliderController? controller;

  const BossSlider({
    Key? key,
    required this.items,
    required this.indicatorBuilder,
    required this.option,
    this.initialIndex = 0,
    this.indicatorSpacing = 0,
    this.bottom,
    this.left,
    this.right,
    this.top,
    this.bgcolor,
    this.controller,
  }) : super(key: key);

  @override
  State<BossSlider> createState() => _BossSliderState();
}

class _BossSliderState extends State<BossSlider> {
  late int current = widget.initialIndex;

  // @override
  // void initState() {
  //   current = widget.initialIndex;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: widget.bgcolor,
          ),
          child: CarouselSlider(
              carouselController: widget.controller,
              options: widget.option.copyWith(
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
              items: widget.items.toList()),
          // items: controller.slides.map((slide) => FlutterLogo()).toList()),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              spacing: widget.indicatorSpacing,
              children: List.generate(
                widget.items.length,
                (index) => widget.indicatorBuilder(index, index == current),
              ),
            ),
          ),
          right: widget.right,
          bottom: widget.bottom,
          left: widget.left,
          top: widget.top,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
