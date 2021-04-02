import 'package:flutter/material.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:provider/provider.dart';

void deleteTypeDialog(BuildContext context, int index) {
  final provider = Provider.of<RestaurantProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text('Are you sure ?'),
        content: Text('Are you sure you want to delete this Type ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.deleteMenu(index);
              Navigator.pop(context);
            },
            child: Text('Confirm'),
          ),
        ],
      );
    },
  );
}
