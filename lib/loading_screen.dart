import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:splashscreen/splashscreen.dart';

import 'screens/home_screen.dart';
import 'screens/message_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool notifications = false;
  bool callFromSplashScreen;

  @override
  void initState() {
    super.initState();
    // launched first to decide where to go next
    firebaseConfiguration();
    // heavy computation that complete after redirection
    checkUserAndToken();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      routeName: "/", // mandatory since v.1.3
      // navigate with seconds
      // seconds: 3,
      // navigateAfterSeconds: notifications ? MessageScreen() : HomeScreen(),
      navigateAfterFuture: getNavigationWidget(),
      backgroundColor: Colors.teal,
      loaderColor: Colors.white,
      loadingText: Text(
        "Chargement...",
        style: TextStyle(color: Colors.white, fontSize: 24.0),
      ),
    );
  }

  void firebaseConfiguration() {
    // For iOS request permission first.
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("iOS Settings registered: $settings");
    });
    // Notifications configurations
    _firebaseMessaging.configure(
      // l'application est inactive
      // ↓ lance l'application suite à un clic sur la notification
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        notifications = true;
        // {notification: {}}
      },
      // l'application est active, mais en arrière-plan
      // ↓ affiche l'application suite à un clic sur la notification
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        notifications = true;
        // {notification: {}
      },
      // l'utilisateur est sur l'application
      // il ne reçoit pas de notification
      // ↓ la propriété onMessage est appelée
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
    );
  }

  // simulate another heavy computation
  checkUserAndToken() async {
    debugPrint("check User");
    // simulate heavy computation
    await Future.delayed(Duration(seconds: 5));
    debugPrint("end of checkUser");

    debugPrint("check Token");
    _firebaseMessaging.getToken().then((token){
      print(token);
    });
    await Future.delayed(Duration(seconds: 5));
    debugPrint("End of check Token");
  }

  Future<Widget> getNavigationWidget() async {
    // prevent from being called twice
    if (callFromSplashScreen == null) {
      debugPrint("Call from SplashScreen to decide where to go");
      callFromSplashScreen = true;

      // simulate heavy computation
      await Future.delayed(Duration(seconds: 5));
      debugPrint("End of the heavy computation");
    }
    // decide where to go next
    Widget navigationWidget = notifications ? MessageScreen() : HomeScreen();
    return Future.value(navigationWidget);
  }
}
