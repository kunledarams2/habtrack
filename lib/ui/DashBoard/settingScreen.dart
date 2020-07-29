import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final Color color;

  SettingScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        automaticallyImplyLeading: false,
        title: Text("Setting"),
      ),
      backgroundColor: color,
    );
  }
}
