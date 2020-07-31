import 'package:flutter/material.dart';
import 'package:petal_bussiness/Provider/RestaurantProvider.dart';
import 'package:petal_bussiness/Widgets/addItemDialog.dart';
import 'package:petal_bussiness/Widgets/addMenuDialog.dart';
import 'package:provider/provider.dart';

class EditMenu extends StatefulWidget {
  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RestaurantProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Menu'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < provider.menu.length; i++)
            ExpansionTile(
              title: Text(provider.menu[i].type),
              children: [
                for (int j = 0; j < provider.menu[i].items.length; j++)
                  ListTile(
                    title: Text(provider.menu[i].items[j].name),
                    trailing: Text(provider.menu[i].items[j].price.toString()),
                  ),
                FlatButton(
                  onPressed: () {
                    addItemDialog(context, i);
                  },
                  child: Text('Add Item'),
                ),
              ],
            ),
          FlatButton(
            onPressed: () {
              addMenuDialog(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
