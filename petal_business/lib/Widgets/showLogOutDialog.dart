import 'package:flutter/material.dart';
import 'package:petal_business/Firebase/LoginFunction.dart';

void showLogOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text('Log Out ?'),
        content: Text('Are you sure you want to Logout ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              firebaseLogOut(context);
            },
            child: Text('Confirm'),
          ),
        ],
      );
    },
  );
}
