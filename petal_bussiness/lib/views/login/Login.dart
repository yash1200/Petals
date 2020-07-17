import 'package:flutter/material.dart';
import 'package:petal_bussiness/Firebase/LoginFunction.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petals For Business'),
      ),
      body: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: '99XXXXXXXX',
                  labelText: 'Phone Number',
                  alignLabelWithHint: true,
                  icon: Icon(Icons.phone)),
              validator: (value) {
                if (value.length != 10) return "Invalid Phone Number";
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                if (key.currentState.validate()) {
                  verifyPhoneNumber(phoneController.text, context);
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
