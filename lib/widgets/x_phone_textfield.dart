import 'package:flutter/material.dart';

class XPhoneTextfield extends StatefulWidget {
  const XPhoneTextfield({Key? key}) : super(key: key);

  @override
  _XPhoneTextfieldState createState() => _XPhoneTextfieldState();
}

class _XPhoneTextfieldState extends State<XPhoneTextfield> {
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
