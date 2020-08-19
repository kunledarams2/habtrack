import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DashBoard/addHabit.dart';
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
    AddHabit(),
    SettingScreen(),
  ];

  final PageController _pageController = PageController(initialPage: 0);

  void onTapNap(index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color:Color(0xFFF6F5FC),
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 75,
            decoration: BoxDecoration(shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    child: IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(0);
                        });
                      },
                    )),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddHabit()));
//                        setState(() {
//                          _pageController.jumpToPage(1);
//                        });
                      },
                    )),
                Container(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(1);
                        });
                      },
                    ))
              ],
          ),
        ),
        ),

        backgroundColor: Colors.grey[200],

        body: PageView(controller: _pageController, children: <Widget>[
          HomeScreen(),
//          AddHabit(),
          SettingScreen(),
        ],)

    );
  }
}
