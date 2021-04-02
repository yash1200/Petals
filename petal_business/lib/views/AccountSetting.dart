import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petal_business/Widgets/CustomDialog.dart';
import 'package:petal_business/Widgets/CustomListTile.dart';
import 'package:petal_business/Widgets/showLogOutDialog.dart';
import 'package:petal_business/views/EditInfo.dart';

class AccountSetting extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CustomListTile(
              title: 'Edit Your Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditInfo();
                    },
                  ),
                );
              },
              icon: Icons.edit,
            ),
            CustomListTile(
              title: 'Delete Your Account',
              icon: Icons.delete,
              onTap: () {
                showDeleteDialog(context, _scaffoldKey);
              },
            ),
            CustomListTile(
              title: 'log Out',
              icon: FontAwesomeIcons.signOutAlt,
              onTap: () {
                showLogOutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
