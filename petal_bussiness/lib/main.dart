import 'package:flutter/material.dart';
import 'package:petal_bussiness/Provider/LoginProvider.dart';
import 'package:provider/provider.dart';

import 'views/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
