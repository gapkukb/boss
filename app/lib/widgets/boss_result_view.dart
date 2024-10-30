import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import '../build_gen/assets.gen.dart';
import 'index.dart';

class BossResultView extends StatelessWidget {
  final ImageProvider? image;
  final String? title;
  final String? description;
  final VoidCallback? onPressed;
  final String buttonText;

  const BossResultView({
    Key? key,
    required this.image,
    this.title,
    this.description,
    this.onPressed,
    this.buttonText = 'OK',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null) Image(image: image!),
          if (title != null) BossGutter.xlarge(),
          if (title != null)
            Text(
              title!,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff3629B7),
              ),
            ),
          if (description != null) BossGutter.large(),
          if (description != null)
            Text(
              description!,
              style: TextStyle(
                fontSize: 28.sp,
                color: Color(0xff343434),
              ),
            ),
          BossGutter.large(),
          GFButton(
            onPressed: onPressed,
            text: buttonText,
            fullWidthButton: true,
            shape: GFButtonShape.pills,
            size: GFSize.LARGE,
            color: Color(0xff3629B7),
          )
        ],
      ),
    );
  }
}
