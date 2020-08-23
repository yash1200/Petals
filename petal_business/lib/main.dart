import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petal_business/Provider/LoginProvider.dart';
import 'package:petal_business/Provider/RestaurantProvider.dart';
import 'package:petal_business/views/HomePage.dart';
import 'package:petal_business/views/login/Login.dart';
import 'package:provider/provider.dart';

import 'views/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Petals Business',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FirebaseAuth.instance.currentUser == null
                  ? Login()
                  : HomePage();
            } else {
              return Center(
                child: Text(
                  "Connect to the internet!",
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
