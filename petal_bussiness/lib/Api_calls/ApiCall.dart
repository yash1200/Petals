import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petal_bussiness/Model/Restaurant.dart';
import 'package:petal_bussiness/values/Strings.dart';

Future<bool> checkUserExists(String phone) async {
  var response = await http.get(Strings().checkUrl + "?phone=$phone");
  if (response.body[0] == 't') return true;
  return false;
}

Future<bool> postRestaurant(Restaurant restaurant) async {
  var response = await http.post(
    Strings().url,
    headers: {"Content-Type": "application/json"},
    body: restaurantToJson(restaurant),
  );
  if (response.statusCode == 200) return true;
  return false;
}
