import 'package:flutter/material.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:provider/provider.dart';

void deleteItemDialog(BuildContext context, int index, int itemIndex) {
  final provider = Provider.of<RestaurantProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text('Are you sure ?'),
        content: Text('Are you sure you want to delete this item ?'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              provider.deleteItem(index, itemIndex);
              Navigator.pop(context);
            },
            child: Text('Confirm'),
          ),
        ],
      );
    },
  );
}
