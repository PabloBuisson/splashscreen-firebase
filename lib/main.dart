import 'package:flutter/material.dart';

import 'screens/contact_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen and Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: kRouteHome,
      routes: {
        kRouteHome: (context) => HomeScreen(),
        kRouteContact: (context) => ContactScreen(),
        kRouteSettings: (context) => SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
