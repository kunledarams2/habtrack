import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Development/habtrack/lib/ui/DashBoard/settingScreen.dart';

import 'DashBoard/homeScreen.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;
  List<Widget> _children = [
    HomeScreen(),
    SettingScreen(Colors.grey[300]),
  ];

  void onTapNap(index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: Container(

          height: 70,
          width: 300,
          decoration: BoxDecoration(shape: BoxShape.rectangle,
          color: Colors.grey[300],
            borderRadius: BorderRadius.only(topRight: Radius.circular(60), topLeft: Radius.circular(60))
          ),
          child: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text(""))

          ],
            backgroundColor: Colors.transparent


          ),
        ),

//        CurvedNavigationBar(
//            key: _bottomNavigationKey,
//            index: _page,
//            height: 65,
//            items: [
//              Icon(
//                Icons.home,
//                size: 30,
//              ),
////              Icon(
////                Icons.add,
////                size: 30,
////              ),
//              Icon(
//                Icons.settings,
//                size: 25,
//              )
//            ],
//            color: Colors.white,
//            buttonBackgroundColor: Colors.white,
//            backgroundColor: Colors.blue[700],
////            animationCurve: Curves,
////            animationDuration: Duration(milliseconds: 650),
//            onTap: onTapNap),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[900],
          child: Icon(Icons.add),
          onPressed: () {},
          elevation: 2.0,
        ),
        body: Container(
          child: _children[_page],
        ));
  }
}
