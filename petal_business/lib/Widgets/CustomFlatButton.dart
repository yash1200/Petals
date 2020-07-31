import 'package:flutter/material.dart';

import 'Constants.dart';

class CustomFlatButton extends StatelessWidget {
  final text;
  final onTap;

  CustomFlatButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Text(
        text,
        style: buttonTextStyle,
      ),
      shape: roundedRectangleBorder,
      color: Colors.black26,
    );
  }
}
