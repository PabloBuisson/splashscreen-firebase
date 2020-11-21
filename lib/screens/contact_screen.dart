import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact"),),
      endDrawer: MenuDrawer(),
    );
  }
}
