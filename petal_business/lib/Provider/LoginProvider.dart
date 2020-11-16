import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _verifyId;

  String get verifyId => _verifyId;

  void setVerifyId(String value) {
    _verifyId = value;
    notifyListeners();
  }
}
