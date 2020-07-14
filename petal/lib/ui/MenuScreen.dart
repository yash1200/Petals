import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petal/models/Restaurant.dart';
import 'package:petal/values/strings.dart';

class MenuScreen extends StatefulWidget {
  String id;

  MenuScreen({this.id});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<Restaurant> getData() async {
    String url = Strings().url + widget.id;
    print(url);
    var response = await http.get(url);
    print("Response:" + response.body);
    Restaurant restaurant = restaurantFromJson(response.body);
    return restaurant;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                ListTile(
                  title: Text(snapshot.data.name),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
