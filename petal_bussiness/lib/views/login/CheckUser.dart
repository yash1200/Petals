import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/ApiCall.dart';
import 'package:petal_bussiness/views/HomePage.dart';
import 'package:petal_bussiness/views/login/SignUp.dart';

class CheckUser extends StatelessWidget {
  final String phone;

  CheckUser({this.phone});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkUserExists(phone),
      builder: (context, snapshot) {
        if (snapshot.data) {
          return HomePage();
        } else if (!snapshot.data) {
          return SignUp();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
