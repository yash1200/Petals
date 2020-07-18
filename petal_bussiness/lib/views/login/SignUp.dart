import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/ApiCall.dart';
import 'package:petal_bussiness/Firebase/LoginFunction.dart';
import 'package:petal_bussiness/Model/Restaurant.dart';
import 'package:petal_bussiness/views/HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController resNameController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  FirebaseUser firebaseUser;
  Restaurant restaurant;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: key,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                onTap: () {
                  key.currentState.reset();
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) return "Name required";
                  return null;
                },
              ),
              TextFormField(
                controller: resNameController,
                onTap: () {
                  key.currentState.reset();
                },
                decoration: InputDecoration(
                  labelText: 'Restaurant Name',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.restaurant),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) return "Name required";
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                onTap: () {
                  key.currentState.reset();
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  restaurant = Restaurant(
                    name: resNameController.text,
                    owner: nameController.text,
                    email: emailController?.text,
                    phone: firebaseUser.phoneNumber,
                    ownerId: firebaseUser.uid,
                    menus: [],
                  );
                  postRestaurant(restaurant).then(
                    (value) => () {
                      if (value) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      }
                    },
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
