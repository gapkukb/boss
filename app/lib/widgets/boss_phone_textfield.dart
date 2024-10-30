import 'package:flutter/material.dart';

class BossPhoneTextfield extends StatefulWidget {
  const BossPhoneTextfield({Key? key}) : super(key: key);

  @override
  _BossPhoneTextfieldState createState() => _BossPhoneTextfieldState();
}

class _BossPhoneTextfieldState extends State<BossPhoneTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.smartphone),
        hintText: "Phone Number",
      ),
    );
  }
}
