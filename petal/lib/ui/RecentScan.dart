import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petal/models/Recents.dart';

import 'MenuScreen.dart';

class RecentScan extends StatefulWidget {
  @override
  _RecentScanState createState() => _RecentScanState();
}

class _RecentScanState extends State<RecentScan> {
  Future<List<Recent>> getData() async {
    final directory = await getApplicationDocumentsDirectory();
    File file;
    String contents;
    try {
      file = File('${directory.path}/data.txt');
      contents = await file.readAsString();
    } catch (e) {
      file = File('${directory.path}/data.txt');
      file.writeAsString('[]');
      contents = await file.readAsString();
    }
    return recentFromJson(contents);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(snapshot.data[index].name),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MenuScreen(
                        id: snapshot.data[index].id,
                      );
                    }));
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/error.png',
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'OOPS! Something went wrong.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: Text('Connect to the internet'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
