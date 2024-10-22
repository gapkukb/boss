import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';

class BossTextfield extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool clearable;
  final bool enabled;
  final bool obscureable;

  const BossTextfield({
    super.key,
    this.hintText,
    this.keyboardType,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.clearable = true,
    this.enabled = true,
    this.obscureable = false,
  });

  @override
  State<BossTextfield> createState() => _BossTextfieldState();
}

class _BossTextfieldState extends State<BossTextfield> {
  final controller = TextEditingController();
  late final ValueNotifier<bool> _counter;
  Widget? suffixIcon;

  final style = TextStyle(
    fontSize: 28.sp,
  );

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(width: 1.r));
  }

  clear() {
    controller.clear();
  }

  @override
  void initState() {
    if (widget.clearable) {
      _counter = ValueNotifier<bool>(true);
      controller.addListener(() {
        _counter.value = controller.text.isEmpty;
      });

      suffixIcon = widget.clearable
          ? ValueListenableBuilder<bool>(
              valueListenable: _counter,
              builder: (context, value, _) {
                return Opacity(
                  opacity: value ? 0 : 1,
                  child: GestureDetector(
                    onTap: clear,
                    child: Icon(Icons.cancel),
                  ),
                );
              },
            )
          : widget.suffixIcon;
    }

    // if (widget.obscureable) {
    //   suffixIcon = Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       GestureDetector(
    //         onTap: widget.obscureable ? clear : null,
    //         child: Icon(Icons.visibility),
    //       )
    //     ],
    //   );
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureable,
      enabled: widget.enabled,
      controller: controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        fillColor: widget.enabled ? Colors.white : Colors.grey,
        filled: true,
        border: border(Colors.black),
        enabledBorder: border(Colors.black),
        disabledBorder: border(Colors.black),
        focusedBorder: border(Colors.black),
        errorBorder: border(Colors.red),
        focusedErrorBorder: border(Colors.red),
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: suffixIcon,
        suffix: SizedBox(
          width: 0.r,
          child: GestureDetector(
            onTap: widget.obscureable ? clear : null,
            child: Icon(Icons.visibility),
          ),
        ),
        labelStyle: style.copyWith(
          color: widget.enabled ? Colors.black : Colors.white,
        ),
        hintStyle: style.copyWith(
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 24.r,
          horizontal: 24.r,
        ),
        focusColor: Colors.transparent,
      ),
    );
  }
}
