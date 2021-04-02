import 'package:flutter/material.dart';
import 'package:petal_business/Network/UpdateInfo.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
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
    nameController.text = provider.restaurant?.owner ?? "";
    resNameController.text = provider.restaurant?.name ?? "";
    emailController.text = provider.restaurant?.email ?? "";
  }

  @override
  void initState() {
    setValues(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Edit'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) return "Name can\'t be empty";
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: resNameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.restaurant),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true)
                  return "Restaurant name can\'t be empty";
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
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
            ElevatedButton(
              onPressed: () {
                updateInfo(
                  context: context,
                  email: emailController.text,
                  owner: nameController.text,
                  name: resNameController.text,
                  key: _scaffoldKey,
                );
              },
              child: Text(
                'Update',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    resNameController.dispose();
    super.dispose();
  }
}
