import 'package:flutter/material.dart';
import 'package:petal_bussiness/Model/Restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  Restaurant _restaurant;
  List<Menu> _menu;

  Restaurant get restaurant => _restaurant;

  void setRestaurant(Restaurant value) {
    _restaurant = value;
    notifyListeners();
  }

  List<Menu> get menu => _menu;

  void addMenu(Menu m) {
    menu.add(m);
    notifyListeners();
  }

  void setMenu(List<Menu> value) {
    _menu = value;
    notifyListeners();
  }
}
