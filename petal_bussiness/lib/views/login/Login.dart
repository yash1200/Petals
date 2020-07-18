import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:petal_bussiness/Firebase/LoginFunction.dart';
import 'package:petal_bussiness/views/login/Confirm.dart';

import 'SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Petals For Business'),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: phoneController,
                onTap: () {
                  key.currentState.reset();
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '99XXXXXXXX',
                  labelText: 'Phone Number',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value.length != 10) return "Invalid Phone Number";
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (key.currentState.validate()) {
                    verifyPhoneNumber(phoneController.text, context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Confirm();
                    }));
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scaffoldKey?.currentState?.dispose();
    key?.currentState?.dispose();
    super.dispose();
  }
}
