import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
