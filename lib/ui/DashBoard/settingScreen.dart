import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  bool isSwitchedNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
      backgroundColor:Color(0xFFF6F5FC),

      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Container(alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text("Setting", style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),)),
          Container(
            margin: EdgeInsets.only(left: 20,top: 40),
            child: Row(
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.orange[900],
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,

                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                    child: Text("Ifeanyi Umunnakwe",style: TextStyle(fontSize: 20),)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 10, top:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Safety lock",style: TextStyle(fontSize: 16),),
                Switch(value: isSwitched, onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                  activeTrackColor: Colors.orange[900],
                  activeColor: Colors.white,)
              ],
            ),
          ),
          Divider(thickness: 1,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 10, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Daily Notification",style: TextStyle(fontSize: 16)),
                Switch(value: isSwitchedNotification, onChanged: (value) {
                  setState(() {
                    isSwitchedNotification = value;
                    print(isSwitchedNotification);
                  });
                },
                  activeTrackColor: Colors.orange[900],
                  activeColor: Colors.white,)
              ],
            ),
          ),
          Divider(thickness: 1,),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Invite friends",style: TextStyle(fontSize: 16)),
                Icon(Icons.navigate_next)

              ],
            ),
          ),
          Divider(thickness: 1,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Contact us",style: TextStyle(fontSize: 16)),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(thickness: 1,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Follow us on Twitter",style: TextStyle(fontSize: 16)),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(thickness: 1,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 10, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Follow us on Instagram",style: TextStyle(fontSize: 16)),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//class Settingcreen extends StatelessWidget {
//
//
//  bool isSwitched = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      appBar: AppBar(
////        backgroundColor: color,
////        automaticallyImplyLeading: false,
////        title: Text("Setting"),
////      ),
//
//
//      body: Column(
//        children: <Widget>[
//          SizedBox(
//            height: 100,
//          ),
//          Container(alignment: Alignment.topLeft, child: Text("Setting")),
//          Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              Container(
//                  decoration: BoxDecoration(
//                      color: Colors.orange[900],
//                      borderRadius: BorderRadius.all(Radius.circular(20))),
//                  child: Icon(
//                    Icons.person,
//                    color: Colors.white,
//                  )),
//              Text("Ifeanyi Umunnakwe"),
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              Text("Safety lock"),
//              Switch(value: isSwitched, onChanged: (value) {
//                setState(() {
//                  isSwitched = value;
//                  print(isSwitched);
//                }})
//            ],
//          )
//        ],
//      ),
//    );
//  }
//}
