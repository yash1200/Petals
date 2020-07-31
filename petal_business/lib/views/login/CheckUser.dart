import 'package:flutter/material.dart';
import 'package:petal_business/Api_calls/ApiCall.dart';
import 'package:petal_business/views/HomePage.dart';
import 'package:petal_business/views/login/SignUp.dart';

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
