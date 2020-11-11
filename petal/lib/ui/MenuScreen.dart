import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petal/models/Restaurant.dart';
import 'package:petal/ui/Menu.dart';
import 'package:petal/ui/Template.dart';
import 'package:petal/values/strings.dart';
import 'package:petal/widgets/connectionError.dart';

import '../models/Restaurant.dart';

class MenuScreen extends StatefulWidget {
  final String? id;

  MenuScreen({this.id});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<Restaurant> getData() async {
    var response = await http.get(Strings().url + widget.id!);
    return restaurantFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MenuWid(
            restaurant: snapshot.data as Restaurant,
          );
        } else if (snapshot.hasError) {
          return Template(
            body: ConnectionError(),
            onTap: () {
              setState(() {});
            },
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Template(
            body: Center(
              child: Text('Connect to the internet'),
            ),
            onTap: () {
              setState(() {});
            },
          );
        } else {
          return Template(
            body: Center(
              child: CircularProgressIndicator(),
            ),
            onTap: () {
              setState(() {});
            },
          );
        }
      },
    );
  }
}
