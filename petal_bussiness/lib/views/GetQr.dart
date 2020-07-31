import 'package:flutter/material.dart';
import 'package:petal_bussiness/Api_calls/SaveQr.dart';
import 'package:petal_bussiness/Provider/RestaurantProvider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GetQr extends StatefulWidget {
  @override
  _GetQrState createState() => _GetQrState();
}

class _GetQrState extends State<GetQr> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RestaurantProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Get QR Code'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              saveQrCode(_scaffoldKey, provider.restaurant.id);
            },
            tooltip: 'Save',
          ),
        ],
      ),
      body: Center(
        child: QrImage(
          data: provider.restaurant.id,
        ),
      ),
    );
  }
}
