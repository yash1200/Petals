import 'package:flutter/material.dart';
import 'package:petal_business/Network/SaveQr.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:petal_business/Widgets/ConnectionError.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GetQr extends StatelessWidget {
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
              saveQrCode(_scaffoldKey, provider.restaurant!.id!);
            },
            tooltip: 'Save',
          ),
        ],
      ),
      body: Center(
        child: provider.restaurant != null
            ? QrImage(
                data: provider.restaurant!.id!,
              )
            : ConnectionError(),
      ),
    );
  }
}
