import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class XCountdownButton extends StatefulWidget {
  final Duration duration;
  final Decoration? decoration;
  final Decoration? disabledDecoration;
  final EdgeInsets padding;
  final Function? onTap;
  final bool autoplay;
  final bool disabled;
  final TextStyle? textStyle;
  final String Function(Duration)? text;
  final String idleText;
  final String retryText;
  final double? width;
  final double? height;

  const XCountdownButton({
    super.key,
    this.textStyle,
    this.decoration,
    this.disabledDecoration,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.onTap,
    this.autoplay = false,
    this.duration = const Duration(seconds: 3),
    this.disabled = false,
    this.text,
    this.idleText = '发送验证码',
    this.retryText = '重新发送',
    this.width,
    this.height,
  });

  @override
  State<XCountdownButton> createState() => _XCountdownButtonState();
}

class _XCountdownButtonState extends State<XCountdownButton> {
  bool counting = false;
  bool retried = false;
  late String text = widget.idleText;

  final _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

  final _decoration = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  );

  late final _disabledDecoration = _decoration.copyWith(
    color: Colors.grey,
  );

  late final StreamDuration streamDuration = StreamDuration(
    config: StreamDurationConfig(
      autoPlay: false,
      countDownConfig: CountDownConfig(duration: widget.duration),
      onDone: onDone,
    ),
  );

  bool get _disabled => widget.disabled || counting;

  @override
  void initState() {
    if (widget.autoplay) onTap();
    super.initState();
  }

  void onDone() {
    retried = true;
    setState(() {
      counting = false;
    });
  }

  void onTap() {
    text = widget.retryText;
    streamDuration
      ..reset()
      ..play();
    widget.onTap?.call();
    setState(() {
      counting = true;
    });
  }

  @override
  void dispose() {
    streamDuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _disabled ? null : onTap,
      child: Container(
        decoration: _disabled ? _disabledDecoration : _decoration,
        padding: widget.padding,
        width: widget.width,
        height: widget.height,
        child: RawSlideCountdown(
          streamDuration: streamDuration,
          builder: (context, duration) {
            var txt = text;
            if (counting) txt = "$text(${duration.inSeconds.toString().padLeft(2, '0')})";

            return Text(
              txt,
              style: widget.textStyle ?? _textStyle,
            );
          },
        ),
      ),
    );
  }
}
