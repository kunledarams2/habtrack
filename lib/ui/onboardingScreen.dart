
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habtrack/data/sliderData.dart';

import 'AuthnScreens/firstScreen.dart';
import 'dashBoard.dart';

class OnBoardScreen extends StatefulWidget {

  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<SliderModel> sliderModel = new List<SliderModel>();
  SliderModel model = new SliderModel();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

/*  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }*/

  @override
  void initState() {
    super.initState();
 /*   if (_auth.currentUser != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    }*/
    sliderModel = model.getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      width: isCurrentPage ? 20.0 : 10.0,
      height: isCurrentPage ? 10.0 : 10.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.lightBlue : Colors.grey[300],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5))),
    );
  }

  // ignore: missing_return
  Widget build(BuildContext context) {

    _auth.authStateChanges().listen((User user) {
      if (user == null) {

         appBody();
      }
      else {

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashBoard()));
      }
    });
    /*return FutureBuilder(
      future: _initialization,
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return somethingWentWrong();
        }
        if (snapShot.connectionState == ConnectionState.done) {

        }
        return loading();
      },
    );*/
  }


  Widget appBody() {
    return
    Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            itemCount: sliderModel.length,
            itemBuilder: (context, index) {
              return SliderTile(
                  sliderModel[index].getImagePath(),
                  sliderModel[index].getSliderTitle(),
                  sliderModel[index].getSliderDesc());
            }),
      ),
      bottomSheet: currentIndex != sliderModel.length - 1
          ? Container(
        color: Colors.white,
        height: 150,
        margin: EdgeInsets.only(bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; sliderModel.length > i; i++)
                  currentIndex == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(
                    sliderModel.length - 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              child: Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.close,
                  color: Colors.lightBlue,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x584286f4)),
              ),
            )
          ],
        ),
      )
          : Container(
        color: Colors.white,
        height: Platform.isIOS ? 70 : 50,
        margin: EdgeInsets.only(
            left: Platform.isIOS ? 0 : 20,
            right: Platform.isIOS ? 0 : 20,
            bottom: Platform.isIOS ? 0 : 20),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AuthnFirstScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Get Started",
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.arrow_forward),
              )
            ],
          ),
          color: Colors.blue[700],
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String pathImage, title, desc;

  SliderTile(this.pathImage, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Image.asset(
            pathImage,
            height: 300,
            width: 500,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
//                fontFamily: "Average-Regular"
            ),
            textAlign: TextAlign.center,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                desc,
                style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 1,
//                    fontWeight: FontWeight.w600,
//                    fontFamily: "Average-Regular"
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
