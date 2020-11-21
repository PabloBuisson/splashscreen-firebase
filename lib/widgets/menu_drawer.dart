import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu Drawer'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, kRouteHome);
            },
          ),
          ListTile(
            title: Text('Messages'),
            onTap: () {
              Navigator.popAndPushNamed(context, kRouteMessages);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.popAndPushNamed(context, kRouteSettings);
            },
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {
              Navigator.popAndPushNamed(context, kRouteContact);
            },
          ),
        ],
      ),
    );
  }
}
