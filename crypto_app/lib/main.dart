import 'package:crypto_app/view/nav_bar.dart';

import '../view/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.id: (context) => Splash(),
        NavBarPage.id: (context) => NavBarPage(),
      },
      initialRoute: Splash.id,
    );
  }
}
