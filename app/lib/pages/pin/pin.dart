import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../widgets/boss_gutter.dart';
import '../../widgets/boss_countdown_button.dart';

class PinPut extends StatefulWidget {
  const PinPut({super.key});

  @override
  State<PinPut> createState() => _PinPutState();
}

class _PinPutState extends State<PinPut> {
  final _defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueGrey.shade100),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  late final focusedPinTheme = _defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(8),
  );

  late final submittedPinTheme = _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration?.copyWith(
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 文字左对齐
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '请输入134****6789收到的6位数验证码',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BossGutter.medium(),
          Pinput(
            length: 6,
            errorBuilder: (errorText, pin) {
              return Text(
                errorText ?? '123',
                style: TextStyle(color: Colors.red),
              );
            },
            defaultPinTheme: _defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            pinputAutovalidateMode: PinputAutovalidateMode.disabled,
            showCursor: true,
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            onCompleted: (value) {
              print(value);
            },
          ),
          BossGutter.medium(),
          Align(
            alignment: Alignment.centerRight,
            child: BossCountdownButton(autoplay: true),
          ),
        ],
      ),
    );
  }
}
