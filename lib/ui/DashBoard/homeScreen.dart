
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5FC),
      body: Column(
        children: <Widget>[welcomeNote()],
      ),
    );
  }

  Widget welcomeNote() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 90,
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              "Hi, Ifeanyi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            )),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "How are you feeling today?",
              style: TextStyle(fontSize: 18),
            )),
        SizedBox(
          height: 200,
        ),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "There are no habits yet. \nTap + button to add your first habit",
              style: TextStyle(fontSize: 18,height: 1.5),
            ))
      ],
    );
  }

//  Widget
}

