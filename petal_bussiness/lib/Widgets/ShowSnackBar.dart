import 'package:flutter/material.dart';

void showSnackBar(var key, String text) {
  key.currentState.showSnackBar(
    SnackBar(
      backgroundColor: Colors.black45,
      content: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
