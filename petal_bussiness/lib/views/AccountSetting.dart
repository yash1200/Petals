import 'package:flutter/material.dart';
import 'package:petal_bussiness/Widgets/CustomDialog.dart';
import 'package:petal_bussiness/Widgets/CustomListTile.dart';
import 'package:petal_bussiness/views/EditInfo.dart';

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
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
            CustomListTile(
              title: 'Edit Your Profile',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditInfo();
                }));
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
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scaffoldKey?.currentState?.dispose();
    super.dispose();
  }
}
