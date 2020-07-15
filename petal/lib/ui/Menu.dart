import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petal/models/Recents.dart';
import 'package:petal/models/Restaurant.dart';

class MenuWid extends StatefulWidget {
  Restaurant restaurant;

  MenuWid({this.restaurant});

  @override
  _MenuWidState createState() => _MenuWidState(restaurant: restaurant);
}

class _MenuWidState extends State<MenuWid> {
  Restaurant restaurant;

  _MenuWidState({this.restaurant});

  void sendData() async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/data.txt');
    String contents = await file.readAsString();
    List<Recent> recents = recentFromJson(contents);
    if (recents.indexOf(Recent(id: restaurant.id, name: restaurant.name)) ==
        -1) {
      recents.remove(Recent(id: restaurant.id, name: restaurant.name));
    }
    recents.add(Recent(id: restaurant.id, name: restaurant.name));
    String newContent = recentToJson(recents);
    file.writeAsString(newContent);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ListTile(
            title: Text('Owner'),
            trailing: Text(restaurant.owner),
          ),
          ListTile(
            title: Text('Phone'),
            trailing: Text(restaurant.phone),
          ),
          for (int i = 0; i < restaurant.menus.length; i++)
            ExpansionTile(
              title: Text(restaurant.menus[i].type),
              children: restaurant.menus[i].items.map((Item item) {
                return ListTile(
                  title: Text(item.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        size: 13,
                      ),
                      Text(
                        item.price.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
