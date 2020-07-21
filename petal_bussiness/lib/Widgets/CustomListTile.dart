import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final onTap;
  final icon;

  CustomListTile({this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}
