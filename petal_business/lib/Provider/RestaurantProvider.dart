import 'package:flutter/material.dart';
import 'package:petal_business/Model/Restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  Restaurant _restaurant;
  List<Menu> _menu;

  Restaurant get restaurant => _restaurant;

  void setRestaurant(Restaurant value) {
    _restaurant = value;
    notifyListeners();
  }

  List<Menu> get menu => _menu;

  void addItem(Item item, int index) {
    menu[index].items.add(item);
    menu[index].items.sort((Item a, Item b) {
      return a.name.compareTo(b.name);
    });
    notifyListeners();
  }

  void deleteItem(int index, int itemIndex) {
    menu[index].items.removeAt(itemIndex);
    notifyListeners();
  }

  void addMenu(Menu m) {
    menu.add(m);
    menu.sort((Menu a, Menu b) {
      return a.type.compareTo(b.type);
    });
    notifyListeners();
  }

  void setMenu(List<Menu> value) {
    _menu = value;
    notifyListeners();
  }

  void deleteMenu(int index) {
    menu.removeAt(index);
    notifyListeners();
  }
}
