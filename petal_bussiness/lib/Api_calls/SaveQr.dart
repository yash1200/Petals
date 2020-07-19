import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:petal_bussiness/Widgets/ShowSnackBar.dart';
import 'package:qr_flutter/qr_flutter.dart';

void saveQrCode(var key, String text) async {
  await Permission.storage.request();
  if (await Permission.storage.request().isGranted) {
    File file = File("/storage/emulated/0/Download/qr_image.png");
    var a = await _getWidgetImage(text);
    file.writeAsBytes(a);
    showSnackBar(key, 'QR Code Saved in Downloads Folder');
  }
}

Future<Uint8List> _getWidgetImage(String text) async {
  final image = await QrPainter(
    data: text,
    version: QrVersions.auto,
    gapless: false,
    color: Color(0xff000000),
    emptyColor: Color(0xffffffff),
  ).toImage(300);
  final a = await image.toByteData(
    format: ImageByteFormat.png,
  );
  return a.buffer.asUint8List();
}
