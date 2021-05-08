import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:habtrack/ui/AuthnScreens/secondScreen.dart';
import 'package:habtrack/ui/DashBoard/settingScreen.dart';

class AuthnFirstScreen extends StatefulWidget {
  @override
  _AuthnFirstScreenState createState() => _AuthnFirstScreenState();
}

class _AuthnFirstScreenState extends State<AuthnFirstScreen> {
  var _nameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "First, let’s introduce ourselves",
                style: TextStyle(
                    color: Colors.white,
//                    fontFamily: "AveriaSerifLibre-Bold",
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//              padding: EdgeInsets.all(20),

              child: TextField(
                cursorColor: Colors.white,
                controller: _nameFieldController,
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
          ],
        ),
        bottomSheet: Container(
          color: Colors.blue[900],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 320,
                height: 50,
//                margin: EdgeInsets.only(left: 20,right: 20),
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    String name = _nameFieldController.text;
                    if (name.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondAuthnScreen(name)));
                    } else  Fluttertoast.showToast(msg: "Enter your name...", toastLength: Toast.LENGTH_LONG);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
