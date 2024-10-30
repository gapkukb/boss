import 'package:flutter/material.dart';

class BossAppBar extends StatelessWidget {
  final String _title;

  @override
  final Size preferredSize;

  BossAppBar(this._title, {Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // your customization here
      title: Text('$_title'),
      centerTitle: true,
      backgroundColor: Colors.black54,
    );
  }
}
