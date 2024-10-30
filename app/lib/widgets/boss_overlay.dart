import 'package:flutter/material.dart';

class BossOverlay extends StatefulWidget {
  final Widget child;

  const BossOverlay({
    Key? key,
    required this.child,
  }) : super(
          key: key,
        );

  @override
  _BossOverlayState createState() => _BossOverlayState();
}

class _BossOverlayState extends State<BossOverlay> {
  // 保存 OverlayEntry 对象
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
    return widget.child;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        right: 50.0,
        child: Material(
          color: Colors.transparent, // 确保点击事件可以穿透
          child: GestureDetector(
            onTap: () {
              // 移除 OverlayEntry
              _overlayEntry?.remove();
              _overlayEntry = null;
            },
            child: Container(
              color: Colors.yellow,
              padding: EdgeInsets.all(20),
              child: Text('Hello Overlay'),
            ),
          ),
        ),
      ),
    );
  }
}
