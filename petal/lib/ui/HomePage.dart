import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petal/RecentProvider.dart';
import 'package:petal/models/Recents.dart';
import 'package:petal/ui/ScarQr.dart';
import 'package:petal/values/strings.dart';
import 'package:provider/provider.dart';

import 'RecentScan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getData(BuildContext context) async {
    final provider = Provider.of<RecentProvider>(context, listen: false);
    final directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/data.txt');
    bool exist = await file.exists();
    if (!exist) {
      file.create().then((value) {
        value.writeAsString('[]');
      });
      provider.setRecent(recentFromJson('[]'));
    } else {
      String contents = await file.readAsString();
      provider.setRecent(recentFromJson(contents));
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings().appName),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ScanQr();
                    }));
                  },
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/qr-code.png',
                            height: size.width * 0.35,
                            width: size.width * 0.35,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'Scan',
                            style: TextStyle(
                              fontSize: size.height * 0.035,
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Recent Scans',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RecentScan(),
            ],
          ),
        ),
      ),
    );
  }
}
