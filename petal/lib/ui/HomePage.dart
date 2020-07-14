import 'package:flutter/material.dart';
import 'package:petal/ui/ScarQr.dart';
import 'package:petal/values/strings.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                width: size.width * 0.8,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/qr-code.png',
                        height: size.width * 0.4,
                        width: size.width * 0.4,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Scan',
                        style: TextStyle(
                          fontSize: size.height * 0.03,
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
        ],
      ),
    );
  }
}
