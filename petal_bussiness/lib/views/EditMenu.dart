import 'package:flutter/material.dart';
import 'package:petal_bussiness/Provider/RestaurantProvider.dart';
import 'package:petal_bussiness/Widgets/addItemDialog.dart';
import 'package:petal_bussiness/Widgets/addMenuDialog.dart';
import 'package:petal_bussiness/Widgets/deleteItemDialog.dart';
import 'package:petal_bussiness/Widgets/deleteTpeDialog.dart';
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
        ],
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
                    onLongPress: () {
                      deleteItemDialog(context, i, j);
                    },
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        addItemDialog(context, i);
                      },
                      child: Text('Add Item'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FlatButton(
                      onPressed: () {
                        deleteTypeDialog(context, i);
                      },
                      child: Text('Delete Type'),
                    ),
                  ],
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
