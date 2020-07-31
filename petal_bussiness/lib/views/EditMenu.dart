import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petal_business/Api_calls/ApiCall.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:petal_business/Widgets/ConnectionError.dart';
import 'package:petal_business/Widgets/CustomFlatButton.dart';
import 'package:petal_business/Widgets/addItemDialog.dart';
import 'package:petal_business/Widgets/addMenuDialog.dart';
import 'package:petal_business/Widgets/deleteItemDialog.dart';
import 'package:petal_business/Widgets/deleteTpeDialog.dart';
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
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              provider.restaurant.menus = provider.menu;
              updateRestaurant(provider.restaurant);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: provider.restaurant != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < provider.menu.length; i++)
                    ExpansionTile(
                      title: Text(provider.menu[i].type),
                      children: [
                        for (int j = 0; j < provider.menu[i].items.length; j++)
                          ListTile(
                            title: Text(provider.menu[i].items[j].name),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FontAwesomeIcons.rupeeSign,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                    provider.menu[i].items[j].price.toString()),
                              ],
                            ),
                            onLongPress: () {
                              deleteItemDialog(context, i, j);
                            },
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomFlatButton(
                              onTap: () {
                                addItemDialog(context, i);
                              },
                              text: "Add Item",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomFlatButton(
                              onTap: () {
                                deleteTypeDialog(context, i);
                              },
                              text: "Delete Type",
                            ),
                          ],
                        ),
                      ],
                    ),
                  CustomFlatButton(
                    onTap: () {
                      addMenuDialog(context);
                    },
                    text: "Add",
                  ),
                ],
              ),
            )
          : Center(
              child: ConnectionError(),
            ),
    );
  }
}
