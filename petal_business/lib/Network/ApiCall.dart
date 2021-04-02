import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petal_business/Model/Restaurant.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:petal_business/values/Strings.dart';
import 'package:provider/provider.dart';

Future<bool> checkUserExists(String phone) async {
  var response = await http.get(
    Uri.parse(
      Strings.checkUrl + "?phone=$phone",
    ),
  );
  if (response.body[0] == 't') return true;
  return false;
}

Future<bool> postRestaurant(Restaurant restaurant) async {
  var response = await http.post(
    Uri.parse(Strings.url),
    headers: {"Content-Type": "application/json"},
    body: restaurantToJson(restaurant),
  );
  if (response.statusCode == 200) return true;
  return false;
}

Future<bool> updateRestaurant(Restaurant restaurant) async {
  var response = await http.put(
    Uri.parse(Strings.url + restaurant.id!),
    headers: {"Content-Type": "application/json"},
    body: restaurantToJson(restaurant),
  );
  if (response.statusCode == 200) return true;
  return false;
}

Future<bool> deleteRestaurant(Restaurant restaurant) async {
  var response = await http.delete(
    Uri.parse(Strings.url + restaurant.id!),
    headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode == 200) return true;
  return false;
}

Future<void> setRestaurant(BuildContext context) async {
  final provider = Provider.of<RestaurantProvider>(context, listen: false);
  final User firebaseUser = FirebaseAuth.instance.currentUser!;
  var response = await http.get(
    Uri.parse(
      Strings.ownerUrl + firebaseUser.uid,
    ),
  );
  provider.setRestaurant(restaurantFromJson(response.body));
  provider.setMenu(provider.restaurant?.menus ?? []);
}
