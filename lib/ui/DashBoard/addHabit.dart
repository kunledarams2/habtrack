import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habtrack/customizeFonts/my_flutter_app_icons.dart';
import 'package:intl/intl.dart';

import '../dashBoard.dart';

class AddHabit extends StatefulWidget {
  @override
  _AddHabitState createState() => _AddHabitState();
}

class IconSelect {
  bool isSelected;
  IconData icon;

  IconSelect({this.isSelected, this.icon});
}

class _AddHabitState extends State<AddHabit> {
  List<IconSelect> habitIcon = new List();
  List<IconSelect> habitIcon2 = new List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    habitIcon
        .add(IconSelect(isSelected: false, icon: MaterialIcons.access_alarm));
    habitIcon
        .add(IconSelect(isSelected: false, icon: FontAwesome5Solid.running));
    habitIcon.add(
        IconSelect(isSelected: false, icon: FontAwesomeIcons.balanceScale));
    habitIcon.add(IconSelect(isSelected: false, icon: Ionicons.ios_trophy));
    habitIcon.add(IconSelect(isSelected: false, icon: MaterialIcons.headset));
    habitIcon.add(IconSelect(isSelected: false, icon: Icons.call_to_action));
    habitIcon.add(IconSelect(isSelected: false, icon: Ionicons.ios_walk));

    habitIcon.add(IconSelect(isSelected: false, icon: FontAwesomeIcons.tint));
    habitIcon.add(IconSelect(isSelected: false, icon: MyFlutterApp.piggy_bank));
    habitIcon.add(IconSelect(isSelected: false, icon: FontAwesome.apple));
    habitIcon
        .add(IconSelect(isSelected: false, icon: MaterialIcons.laptop_mac));
    habitIcon
        .add(IconSelect(isSelected: false, icon: FontAwesomeIcons.bookReader));
    habitIcon
        .add(IconSelect(isSelected: false, icon: FontAwesome5Solid.coffee));
    habitIcon.add(IconSelect(isSelected: false, icon: Ionicons.ios_walk));
  }

  List<IconData> _icons = [
    MaterialIcons.access_alarm,
    FontAwesome5Solid.running,
    FontAwesomeIcons.balanceScale,
    Ionicons.ios_trophy,
    MaterialIcons.headset,
    Icons.call_to_action,
//    MaterialIcons.laptop_mac,
    Ionicons.ios_walk,
  ];

  List<String> daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  List<Color> _colors = [
    Color(0xFFFF464F),
    Color(0xFFFF8A34),
    Color(0xFF25C685),
    Color(0xFF950A6B),
  ];

  int isIconSelected = -1;
  int isColorSelected = -1;

  var timeCounter = 0;
  DateTime _selectDate;
  DateTime dateTime = DateTime.now();
  var _startDateController = TextEditingController();
  var _endDateController = TextEditingController();
  bool visible = false;
  bool isHabitWeekly = false;
  var value;

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005df2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashBoard()));
                  },

                  /*Icons.close,
                  color: Colors.white,*/
                ),
                SizedBox(
                  width: 95,
                ),
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                                  color: Colors.white70,
                                  style: BorderStyle.solid)),
                          labelText: "Name",
                          labelStyle: TextStyle(color: Colors.white70)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                          onPressed: () {
                            setState(() {
                              isHabitWeekly = false;
                            });
                          },
                          child: Text(
                            "Daily",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: isHabitWeekly? Colors.white : Colors.grey,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              isHabitWeekly = true;
                            });
                          },
                          child: Text(
                            "Weekly",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  Widget _dailyWidget() {
    return Column(
      children: <Widget>[
        Visibility(
          visible: isHabitWeekly,
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "What days of the week do you want to do it?",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _buildDaysOfWeek(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "How many times a day?",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: Color(0xFF005df2),
                    size: 15.0,
                  ),
                  onPressed: () {
                    _decrementHabitTimeDay();
                  }),
            ),
            Text(
              "$timeCounter Time",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Color(0xFF005df2),
                      size: 15,
                    ),
                    onPressed: () {
                      _incrementHabitTimeDay();
                    })),
          ],
        ),
        SizedBox(
          height: 20,
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
          height: 15,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    controller: _startDateController,
                    focusNode: AlwaysDisabledFocusNode(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "May, 12 2020",
                      hintStyle: TextStyle(height: 1.2),
                    ),
                    onTap: () {
                      _selectedDate(context, _startDateController);
                    },
                    /*       "12-06-2020",
                    style: TextStyle(height: 2.2),
                    textAlign: TextAlign.center,*/
                  ),
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    controller: _endDateController,
                    onTap: () {
                      _selectedDate(context, _endDateController);
                    },
                    focusNode: AlwaysDisabledFocusNode(),
                    decoration: InputDecoration(
                        hintText: "May, 20, 2021",
                        hintStyle: TextStyle(height: 1.2),
                        border: InputBorder.none),
                  ),
                )),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, top: 40, bottom: 10),
          child: Text(
            "Select an icon",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _buildGridBuild(context),
                /* Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icons
                      .asMap()
                      .entries
                      .map((MapEntry map) =>
                          _buildIcon(map.key, _icons, context))
                      .toList(),
                ),*/
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icon2
                      .asMap()
                      .entries
                      .map((MapEntry map) =>
                          _buildIcon(map.key, _icon2, context))
                      .toList(),
                ),*/
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Text(
            "Select color",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildColor(context),
          ],
        )),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, top: 30, bottom: 10),
          child: Text(
            "Set a reminder so you don’t forget",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: visible,
              child: Container(
                  height: 40,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "$value",
                    style: TextStyle(fontFamily: "AvertaStd"),
                  )),
              replacement: RaisedButton(
                onPressed: () {
                  _timePickerWidget(context);
                },
                child: Text("Create Reminder"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                textColor: Color(0xFF344356),
              ),
            ),
          ],
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
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

  Widget _buildIcon(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(),
      child: Container(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: habitIcon.length,
            /*_icons.length,*/
            itemBuilder: (context, int index) {
              final s = _icons[index];
              // final s2 = _icon2[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < _icons.length; i++) {
                      if (i == index) {
                        habitIcon[i].isSelected = true;
                      } else {
                        habitIcon[i].isSelected = false;
                      }
                    }
                    print(index);
                  });
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _habitIconHolder(
                            habitIcon[index].isSelected, habitIcon[index].icon),
                      ],
                    )),
              );
            }),
      ),
    );

    /*   Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: IconButton(
        icon: Icon(
          icons[index],
          size: 25,
          color: Colors.white70,
        ),
        onPressed: () {
          for(int i =0 ; i <icons.length; i++){
            if(i ==index){
              setState(() {
                print(i);

              });
            }
          }
        },
        */ /*      icons[index],
        size: 25,
        color: Colors.white70,*/ /*
      ),
    );*/
  }

  Widget _habitIconHolder(bool isIconSelected, IconData icon) {
    return Container(
      child: Icon(
        icon,
        color: isIconSelected ? Colors.white : Colors.white24,
      ),
    );
  }

  Widget _buildGridBuild(BuildContext context) {
    return Container(
      height: 130,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              maxCrossAxisExtent: 40,
              mainAxisSpacing: 20),
          itemCount: habitIcon.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isIconSelected = index;
                  print(index);
                });
              },
              child: Icon(
                habitIcon[index].icon,
                color: isIconSelected == index ? Colors.white : Colors.white24,
              ),
            );
          }),
    );
  }

  Widget _buildColor(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        child: Container(
          height: 40,
          child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _colors.length,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isColorSelected = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: _colors[index],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: isColorSelected == index
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                );
              }),
        ));
  }

  Widget _buildDaysOfWeek(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(),
      child: Container(
        height: 60,
        child: ListView.builder(
            physics: ScrollPhysics(),
            reverse: true,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: daysOfWeek.length,
            itemBuilder: (context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  daysOfWeek[index],
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
      ),
    );
  }

  Future _timePickerWidget(BuildContext context) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
              // color: Colors.white,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: CupertinoActionSheet(
                actions: <Widget>[_buildTimePickerWidget()],
                title: Text(
                  "Select Time",
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                ),
                cancelButton: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF005df2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          value = DateFormat('h:mm a').format(dateTime);
                          Fluttertoast.showToast(
                              msg: value.toString(),
                              toastLength: Toast.LENGTH_LONG);
                        });
                        visible = true;
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "AvertaStd"),
                      )),
                ),
              ),
            ));
  }

  Widget _buildTimePickerWidget() => SizedBox(
        height: 230,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          minuteInterval: 10,
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (dateTime) {
            setState(() {
              this.dateTime = dateTime;
              print(dateTime);
            });
          },
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }

  _incrementHabitTimeDay() {
    setState(() {
      timeCounter++;
    });
  }

  _decrementHabitTimeDay() {
    setState(() {
      if (timeCounter != 0) {
        timeCounter--;
      }
    });
  }

  _selectedDate(
      BuildContext context, TextEditingController textEditingController) async {
    DateTime dateTime = await showDatePicker(
        context: context,
        initialDate: _selectDate != null ? _selectDate : DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2050),
        builder: (BuildContext context, Widget child) {
          return Theme(
              data: ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.dark(
                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                      surface: Colors.blueGrey,
                      onSurface: Colors.white),
                  dialogBackgroundColor: Colors.blue[500]),
              child: child);
        });

    if (dateTime != null) {
      _selectDate = dateTime;
      textEditingController
        ..text = DateFormat.yMMMd().format(_selectDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
