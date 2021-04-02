import 'package:flutter/material.dart';
import 'package:petal_business/Model/Restaurant.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:provider/provider.dart';

void addMenuDialog(BuildContext context) {
  TextEditingController typeController = TextEditingController();
  final provider = Provider.of<RestaurantProvider>(context, listen: false);
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Type'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (key.currentState!.validate()) {
                provider.addMenu(
                  Menu(
                    type: typeController.text,
                    items: [],
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: Text('Confirm'),
          ),
        ],
        content: Form(
          key: key,
          child: TextFormField(
            controller: typeController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Chapati',
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) return "Type can\'t be empty";
              return null;
            },
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
    },
  );
}
