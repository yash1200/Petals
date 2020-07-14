import 'package:flutter/material.dart';
import 'package:petal/values/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings().appName),
      ),
      body: Container(),
    );
  }
}
