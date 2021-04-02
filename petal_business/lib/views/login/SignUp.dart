import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petal_business/Network/ApiCall.dart';
import 'package:petal_business/Model/Restaurant.dart';
import 'package:petal_business/Widgets/CustomFlatButton.dart';
import 'package:petal_business/views/HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController resNameController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late User firebaseUser;
  late Restaurant restaurant;

  void getUserL() {
    firebaseUser = FirebaseAuth.instance.currentUser!;
  }

  @override
  void initState() {
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
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return "Name required";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: resNameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Restaurant Name',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true)
                      return "Restaurant name required";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                CustomFlatButton(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      restaurant = Restaurant(
                        name: resNameController.text,
                        owner: nameController.text,
                        email: emailController.text,
                        phone: firebaseUser.phoneNumber!.substring(3),
                        ownerId: firebaseUser.uid,
                        menus: [],
                      );
                      postRestaurant(restaurant).then(
                        (value) {
                          if (value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    resNameController.dispose();
    super.dispose();
  }
}
