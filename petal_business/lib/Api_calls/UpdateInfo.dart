import 'package:flutter/material.dart';
import 'package:petal_business/Model/Restaurant.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:petal_business/Widgets/ShowSnackBar.dart';
import 'package:provider/provider.dart';

import 'ApiCall.dart';

void updateInfo({
  BuildContext context,
  String owner,
  String name,
  String email,
  var key,
}) {
  final provider = Provider.of<RestaurantProvider>(context, listen: false);
  Restaurant _restaurant = provider.restaurant;
  if (_restaurant.owner == owner &&
      _restaurant.name == name &&
      _restaurant.email == email) {
    showSnackBar(key, 'No changes made');
  } else {
    _restaurant.email = email;
    _restaurant.name = name;
    _restaurant.owner = owner;
    updateRestaurant(_restaurant).then((value) {
      if (!value) {
        showSnackBar(key, "Some Error Occurred!");
      } else {
        provider.setRestaurant(_restaurant);
        Navigator.pop(context);
      }
    });
  }
}
