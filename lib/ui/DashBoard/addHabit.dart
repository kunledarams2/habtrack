import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddHabit extends StatefulWidget {
  @override
  _AddHabitState createState() => _AddHabitState();
}

class _AddHabitState extends State<AddHabit> {
  List<IconData> _icons = [
    FontAwesome5Solid.running,
    FontAwesomeIcons.balanceScale,
    MaterialIcons.headset,
    Icons.call_to_action,
    MaterialIcons.laptop_mac,
    Ionicons.ios_walk,

  ];
  List<Color> _colors = [
    Color(0xFFFF464F),
    Color(0xFFFF8A34),
    Color(0xFF25C685),
    Color(0xFF950A6B),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005df2),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
                Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                SizedBox(width: 95,),
                Container(

//                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "New Habit",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//              padding: EdgeInsets.all(20),

            child: TextField(
              cursorColor: Colors.white,
//              controller: _nameFieldController,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white70, style: BorderStyle.solid)),
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.white70)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "How often do you want to do it?",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Daily",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Weekly",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _dailyWidget(),
        ],
      ),
    );
  }

  Widget _dailyWidget() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "How many times a day?",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white),
                child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Color(0xFF005df2),

                    ),
                    onPressed: () {})),
            Text(
              "1 Time",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Color(0xFF005df2),
                    ),
                    onPressed: () {})),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "What is the duration of this habit?",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Start Date",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "End Date",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                height: 40,
                width: 120,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white),
                child: Text(
                  "12-06-2020",
                  style: TextStyle(height: 2.2),
                  textAlign: TextAlign.center,
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                height: 40,
                width: 120,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white),
                child: Text(
                  "12-06-2020",
                  style: TextStyle(height: 2.2),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Text(
            "Select an icon",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _icons
              .asMap()
              .entries
              .map((MapEntry map) => _buildIcon(map.key))
              .toList(),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Text(
            "Select color",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _colors
              .asMap()
              .entries
              .map((MapEntry map) => _buildColor(map.key))
              .toList(),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Text(
            "Set a reminder so you don’t forget",
            style: TextStyle(color: Colors.white),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text("Create Reminder"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          textColor: Color(0xFF344356),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {},
            child: Text(
              "Complete",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            textColor: Color(0xFF344356),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildIcon(int index) {
    return Container(
      child: Icon(
        _icons[index],
        size: 25,
        color: Colors.grey[200],
      ),
    );
  }

  Widget _buildColor(int index) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: _colors[index],
          borderRadius: BorderRadius.all(Radius.circular(40))),
    );
  }
}
