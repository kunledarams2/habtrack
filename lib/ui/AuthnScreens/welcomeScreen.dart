import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habtrack/ui/dashBoard.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/get_start.PNG",
          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Let’s start an exciting journey",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black87),
              )),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text("in which"),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Ifeanyi learns how to seize each day \none step at a time.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
              )),
          Container(
            width: 250,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoard()));
              },
              color: Colors.blue[700],
              textColor: Colors.white,
              child: Text("Let's do it !",style: TextStyle(fontWeight: FontWeight.w600),),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          )
        ],
      ),
    );
  }
}
