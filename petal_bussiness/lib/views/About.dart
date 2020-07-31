import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'This App is Developed by Yash Johri',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
