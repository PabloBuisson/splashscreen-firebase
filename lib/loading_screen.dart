import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';

import 'screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      routeName: "/", // obligatoire depuis version 1.3
      seconds: 3,
      navigateAfterSeconds: HomeScreen(),
      backgroundColor: Colors.teal,
      loaderColor: Colors.white,
      loadingText: Text(
        "Chargement...",
        style: TextStyle(color: Colors.white, fontSize: 24.0),
      ),
    );
  }
}
