import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petals'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
