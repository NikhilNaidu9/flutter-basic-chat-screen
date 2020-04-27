import 'package:flutter/material.dart';
import 'main.dart';
import 'chat_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Fuzz Everyone"),
          backgroundColor: Colors.black,
        ),
        body: new ChatScreen());
  }
}
