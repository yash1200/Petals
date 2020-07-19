import 'package:flutter/material.dart';
import 'package:petal_bussiness/Model/Restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  Restaurant _restaurant;

  Restaurant get restaurant => _restaurant;

  void setRestaurant(Restaurant value) {
    _restaurant = value;
    notifyListeners();
  }
}
