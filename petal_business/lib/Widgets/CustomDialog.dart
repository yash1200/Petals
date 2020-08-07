import 'package:flutter/material.dart';
import 'package:petal_business/Network/ApiCall.dart';
import 'package:petal_business/Firebase/LoginFunction.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:petal_business/Widgets/ShowSnackBar.dart';
import 'package:provider/provider.dart';

void showDeleteDialog(BuildContext context, var key) {
  final provider = Provider.of<RestaurantProvider>(context, listen: false);
  showDialog(
    context: context,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text('Delete Account ?'),
      content: Text('Are you sure you want to delete your account ?'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            deleteRestaurant(provider.restaurant).then((value) {
              if (value) {
                firebaseLogOut(context);
              } else {
                showSnackBar(key, 'Something Went wrong!');
              }
            });
          },
          child: Text('Confirm'),
        ),
      ],
    ),
  );
}
