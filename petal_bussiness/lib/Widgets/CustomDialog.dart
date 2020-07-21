import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/ApiCall.dart';
import 'package:petal_bussiness/Provider/RestaurantProvider.dart';
import 'package:petal_bussiness/Widgets/ShowSnackBar.dart';
import 'package:petal_bussiness/views/login/Login.dart';
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
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
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
