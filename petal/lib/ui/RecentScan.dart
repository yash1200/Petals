import 'package:flutter/material.dart';
import 'package:petal/provider/RecentProvider.dart';
import 'package:provider/provider.dart';

import 'MenuScreen.dart';

class RecentScan extends StatefulWidget {
  @override
  _RecentScanState createState() => _RecentScanState();
}

class _RecentScanState extends State<RecentScan> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecentProvider>(context);
    if (provider.getRecent() != null) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: provider.getRecent().length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(provider.getRecent()[index].name),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MenuScreen(
                    id: provider.getRecent()[index].id,
                  );
                }));
              },
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
