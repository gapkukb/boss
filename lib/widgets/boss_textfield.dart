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
  final String initText;
  final double? height;

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
    this.initText = '',
    this.height,
  });

  @override
  State<BossTextfield> createState() => _BossTextfieldState();
}

class _State {
  final bool obscureText;
  final bool emptyValue;

  _State({
    this.emptyValue = true,
    this.obscureText = false,
  });

  copyWith({
    emptyValue = true,
    obscureText = false,
  }) {
    return _State(
      emptyValue: emptyValue ?? this.emptyValue,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}

class _BossTextfieldState extends State<BossTextfield> {
  final controller = TextEditingController();
  late final ValueNotifier<_State> _state;
  Widget? suffixIcon;

  final style = TextStyle(
    fontSize: 28.sp,
  );

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(width: 1.r));
  }

  clear() {
    print('object');
    controller.clear();
  }

  Opacity _buildClearButton() {
    return Opacity(
      opacity: _state.value.emptyValue ? 0 : 1,
      child: GestureDetector(
        onTap: _state.value.emptyValue ? null : clear,
        child: Icon(
          Icons.cancel,
          size: 48.r,
        ),
      ),
    );
  }

  GestureDetector _buildVisiblityButton() {
    return GestureDetector(
      onTap: () {
        _state.value = _state.value.copyWith(obscureText: !_state.value.obscureText);
      },
      child: Icon(
        _state.value.obscureText ? Icons.visibility : Icons.visibility_off,
        size: 48.r,
      ),
    );
  }

  @override
  void initState() {
    controller.text = widget.initText;
    _state = ValueNotifier<_State>(_State(emptyValue: controller.text.isEmpty));

    controller.addListener(() {
      _state.value = _state.value.copyWith(emptyValue: controller.text.isEmpty);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureable,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
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
        suffixIcon: widget.suffixIcon,
        contentPadding: EdgeInsets.zero,
        focusColor: Colors.transparent,
        constraints: BoxConstraints(
          maxHeight: widget.height ?? 88.r,
        ),
        // suffix: ValueListenableBuilder(
        //   valueListenable: _state,
        //   builder: (context, value, child) {
        //     return Wrap(
        //       children: [
        //         if (widget.clearable) _buildClearButton(),
        //         if (widget.obscureable) _buildVisiblityButton(),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
