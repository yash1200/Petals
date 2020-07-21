import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/ApiCall.dart';
import 'package:petal_bussiness/Widgets/CustomCard.dart';
import 'package:petal_bussiness/views/AccountSetting.dart';
import 'package:petal_bussiness/views/GetQr.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    setRestaurant(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petals'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(
                image: "qr-code.png",
                text: "Get QR Code",
                intent: GetQr(),
              ),
              CustomCard(
                image: "system.png",
                text: "Account Settings",
                intent: AccountSetting(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
