import 'package:flutter/material.dart';
import 'package:petal_business/Model/Restaurant.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:provider/provider.dart';

void addItemDialog(BuildContext context, int index) {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final provider = Provider.of<RestaurantProvider>(context, listen: false);
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Item'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              if (key.currentState!.validate()) {
                provider.addItem(
                  Item(
                    name: nameController.text,
                    price: int.parse(priceController.text),
                  ),
                  index,
                );
                Navigator.pop(context);
              }
            },
            child: Text('Confirm'),
          ),
        ],
        content: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Chapati',
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Type can\'t be empty";
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '20',
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Price can\'t be empty";
                  return null;
                },
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
    },
  );
}
