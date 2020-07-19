import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/UpdateInfo.dart';
import 'package:petal_bussiness/Provider/RestaurantProvider.dart';
import 'package:provider/provider.dart';

class EditInfo extends StatefulWidget {
  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController resNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void setValues(BuildContext context) {
    final provider = Provider.of<RestaurantProvider>(context, listen: false);
    nameController.text = provider.restaurant.owner;
    resNameController.text = provider.restaurant.name;
    emailController.text = provider.restaurant.email;
  }

  @override
  void initState() {
    // TODO: implement initState
    setValues(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) return "Name can\'t be empty";
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: resNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.restaurant),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) return "Restaurant name can\'t be empty";
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                updateInfo(
                  context: context,
                  email: emailController.text,
                  owner: nameController.text,
                  name: resNameController.text,
                  key: _scaffoldKey,
                );
              },
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Text(
                'Update',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
