import 'package:flutter/material.dart';
import 'Constants.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  CustomFlatButton({
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: buttonTextStyle,
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        shape: roundedRectangleBorder,
        backgroundColor: Colors.black26,
      ),
    );
  }
}
