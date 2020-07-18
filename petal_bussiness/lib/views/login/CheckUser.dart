import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/ApiCall.dart';
import 'package:petal_bussiness/views/HomePage.dart';
import 'package:petal_bussiness/views/login/SignUp.dart';

void checkUser(BuildContext context, String phone) async {
  bool user = await checkUserExists(phone);
  if (user) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  } else {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SignUp();
    }));
  }
}
