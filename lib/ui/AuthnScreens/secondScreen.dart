import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:habtrack/data/User.dart';
import 'package:habtrack/database/firebaseUtils.dart';
import 'package:habtrack/ui/DashBoard/homeScreen.dart';
import 'package:habtrack/ui/dashBoard.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SecondAuthnScreen extends StatefulWidget {
  final String userName;

  SecondAuthnScreen(this.userName, {Key key}) : super(key: key);

  @override
  _SecondAuthnScreenState createState() => _SecondAuthnScreenState();
}

abstract class FirebaseDatabaseCallBack {
  void addUser(Users user);

  void update(Users user);
}

class _SecondAuthnScreenState extends State<SecondAuthnScreen>
    implements FirebaseDatabaseCallBack {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

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
                "Your Email and Password",
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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: passwordController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70, style: BorderStyle.solid)),
                    fillColor: Colors.white,
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.white70,
                        decorationColor: Color(0XFFFFCC00))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child:
                  /*Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[*/
                  TextFormField(
                controller: confirmpasswordController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70, style: BorderStyle.solid)),
                    fillColor: Colors.white,
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                        color: Colors.white70,
                        decorationColor: Color(0XFFFFCC00))),
              ),

              // ],
              // )
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.blue[900],
          height: 150,
          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 40, right: 20),
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
                width: 320,
                height: 50,
//                margin: EdgeInsets.only(left: 30, right: 30),
                child: RaisedButton(
                  onPressed: () => _createUser(),

                  /*{
                    // _SecondAuthnScreenState().addUser(user)
                   User user;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  _addNewUser()));
                  },*/
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 0,
              )
            ],
          ),
        ));
  }

  FirebaseUtils firebaseUtils;
  bool _anchorToBottom = false;

  @override
  void initState() {
    super.initState();
    firebaseUtils = new FirebaseUtils();
    firebaseUtils.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firebaseUtils.dispose();
  }

  @override
  void addUser(Users user) {
    setState(() {
      firebaseUtils.addUser(user);
    });
  }

  @override
  void update(Users user) {
    setState(() {
      firebaseUtils.updateUser(user);
    });
  }

  Future<void> saveUser(BuildContext context,
      _SecondAuthnScreenState _secondAuthnScreenState, Users user) {
    _secondAuthnScreenState.addUser(user);
  }


  Future<void> _createUser() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Email is required...", toastLength: Toast.LENGTH_LONG);
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Password is required...", toastLength: Toast.LENGTH_LONG);
    } else if (confirmpasswordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Password is required...", toastLength: Toast.LENGTH_LONG);
    } else if (confirmpasswordController.text.toString() !=
        passwordController.text.toString()) {
      Fluttertoast.showToast(
          msg: "Confirm password does not match...",
          toastLength: Toast.LENGTH_LONG);
    } else {
      await Firebase.initializeApp();
      try {
        User firebaseUser = await _auth
            .createUserWithEmailAndPassword(
                email: emailController.text.toString(),
                // ignore: missing_return
                password: confirmpasswordController.text.toString())
            // ignore: missing_return
            .then((user) {
          if(user.user.email.isNotEmpty){
            addUser(Users("", widget.userName, user.user.email));
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
          }
          print(user.user.email);
        });

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(
              msg: "Password is too weak...", toastLength: Toast.LENGTH_LONG);
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
              msg: "Email already exist...", toastLength: Toast.LENGTH_LONG);
        }
      } catch (e) {
        print(e.toString());
      }


      /*  addUser(User("", widget.userName, emailController.text.toString()));*/
      Fluttertoast.showToast(
          msg: widget.userName, toastLength: Toast.LENGTH_LONG);
    }
  }
}
