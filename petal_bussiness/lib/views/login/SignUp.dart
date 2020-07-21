import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/ApiCall.dart';
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

  void getUserL() async {
    firebaseUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserL();
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
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
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
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: resNameController,
                  decoration: InputDecoration(
                    labelText: 'Restaurant Name',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return "Restaurant name required";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    if (key.currentState.validate()) {
                      restaurant = Restaurant(
                        name: resNameController.text,
                        owner: nameController.text,
                        email: emailController?.text,
                        phone: firebaseUser.phoneNumber.substring(3),
                        ownerId: firebaseUser.uid,
                        menus: [],
                      );
                      postRestaurant(restaurant).then(
                        (value) {
                          if (value) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          }
                        },
                      );
                    }
                  },
                  child: Text('Sign Up'),
                  color: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
