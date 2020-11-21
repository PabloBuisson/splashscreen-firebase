import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messages"),),
      endDrawer: MenuDrawer(),
    );
  }
}