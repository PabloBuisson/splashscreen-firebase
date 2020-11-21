import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../widgets/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    firebaseConfiguration();
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
        // {notification: {}}
      },
      // l'application est active, mais en arrière-plan
      // ↓ affiche l'application suite à un clic sur la notification
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // {notification: {}
      },
    );
    _firebaseMessaging.getToken().then((token){
      print(token);
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      endDrawer: MenuDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}