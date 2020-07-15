import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petal/models/Restaurant.dart';
import 'package:petal/ui/Menu.dart';
import 'package:petal/values/strings.dart';

class MenuScreen extends StatefulWidget {
  String id;

  MenuScreen({this.id});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<Restaurant> getData() async {
    var response = await http.get(Strings().url + widget.id);
    return restaurantFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MenuWid(
              restaurant: snapshot.data,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/error.png',
                    height: size.width * 0.4,
                    width: size.width * 0.4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'OOPS! Something went wrong.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text('Connect to the internet'),
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
