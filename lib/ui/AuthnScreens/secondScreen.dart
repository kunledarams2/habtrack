import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habtrack/ui/AuthnScreens/welcomeScreen.dart';

class SecondAuthnScreen extends StatefulWidget {
  @override
  _SecondAuthnScreenState createState() => _SecondAuthnScreenState();
}

class _SecondAuthnScreenState extends State<SecondAuthnScreen> {
  var emailController = TextEditingController();

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
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Your Email",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
//              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70, style: BorderStyle.solid)),
                    fillColor: Colors.white,
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white70,
                      decorationColor: Color(0XFFFFCC00),
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
//          Container(
//            width: 350,
//            height: 50,
//            child: RaisedButton(
//              onPressed: () {},
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(5)),
//              child: Text("Continue"),
//            ),
//          ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.blue[900],
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: null,
                      onChanged: null,
                      activeColor: Colors.grey,
                      focusColor: Colors.grey,
                    ),
                    Text(
                      "Please do not send me newsletter",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 50,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
