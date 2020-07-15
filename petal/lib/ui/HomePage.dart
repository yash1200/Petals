import 'package:flutter/material.dart';
import 'package:petal/ui/ScarQr.dart';
import 'package:petal/values/strings.dart';

import 'RecentScan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
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
