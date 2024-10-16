import 'package:flutter/material.dart';

class Protocol extends StatelessWidget {
  const Protocol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var richText = RichText(
      text: TextSpan(
        text: "请先阅读并同意",
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: "<用户协议>",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          TextSpan(
            text: "和",
          ),
          TextSpan(
            text: "<隐私协议>",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );

    return CheckboxListTile.adaptive(
      value: false,
      onChanged: (value) {},
      title: richText,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4),
    );
  }
}
