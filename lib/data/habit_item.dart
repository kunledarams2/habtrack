import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HabitItem extends StatelessWidget {
  String _habitName;
  String _habitIcon;
  String _habitIconFamily;
  String _habitIconPackageName;
  String _habitColor;
  String _habitType;
  String _habitStartDate;
  String _habitEndDate;
  int _habitCounter;
  int _habitTotalCounter;
  int _habitDuration;
  int _id;

  HabitItem(
      this._habitName,
      this._habitIcon,
      this._habitColor,
      this._habitType,
      this._habitCounter,
      this._habitStartDate,
      this._habitEndDate,
      this._habitIconFamily,
      this._habitIconPackageName);

  HabitItem.map(dynamic obj) {
    this._habitName = obj["habitName"];
    this._habitIcon = obj["habitIcon"];
    this._habitIconFamily = obj["habitIconFamily"];
    this._habitIconPackageName = obj["habitIconPackageName"];
    this._habitColor = obj["habitColor"];
    this._habitCounter = obj["habitCounter"];
    this._habitType = obj["habitType"];
    this._habitStartDate = obj["habitStartDate"];
    this._habitEndDate = obj["habitEndDate"];
    this._id = obj["id"];
  }

  String get habitName => _habitName;

  String get habitIcon => _habitIcon;

  String get habitColor => _habitColor;

  String get habitType => _habitType;

  int get habitCounter => _habitCounter;

  String get habitStartDate => _habitStartDate;

  String get habitEndDate => _habitEndDate;

  String get habitIconFamily => _habitIconFamily;

  String get habitIconPackageName => _habitIconPackageName;

  int get habitTotalCounter {
    DateTime startDate = DateTime.parse(_habitStartDate);
    DateTime endDate = DateTime.parse(_habitEndDate);
    final dateDifferent = endDate.difference(startDate).inDays;
    _habitTotalCounter = dateDifferent * _habitCounter;
    print("mmdnnnnnnnnnnnnnnnnnnn:::$_habitTotalCounter");
    return _habitTotalCounter;
  }

  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["habitName"] = _habitName;
    map["habitCounter"] = _habitCounter;
    map["habitType"] = _habitType;
    map["habitColor"] = _habitColor;
    map["habitIcon"] = _habitIcon;
    map["habitIconFamily"] = _habitIconFamily;
    map["habitIconPackageName"] = _habitIconPackageName;
    map["habitStartDate"] = _habitStartDate;
    map["habitEndDate"] = _habitEndDate;

    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  HabitItem.fromMap(Map<String, dynamic> map) {
    this._habitName = map["habitName"];
    this._habitType = map["habitType"];
    this._habitCounter = map["habitCounter"];
    this._habitColor = map["habitColor"];
    this._habitIcon = map["habitIcon"];
    this._habitIconFamily = map["habitIconFamily"];
    this._habitIconPackageName = map["habitIconPackageName"];
    this._habitStartDate = map["habitStartDate"];
    this._habitEndDate = map["habitEndDate"];
    this._id = map["id"];
  }

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Color(int.parse(_habitColor)),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Icon(
                  IconData(int.parse(_habitIcon),
                      fontFamily: _habitIconFamily,
                      fontPackage: _habitIconPackageName),
                  color: Colors.white,
                  size: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _habitName,
                      style: TextStyle(fontSize: 20, fontFamily: "AvertaStd"),
                    ),
                    Text(
                      _habitType == "Daily"
                          ? "Daily . Completed $_habitCounter/${DateTime.parse(_habitEndDate).difference(DateTime.parse(_habitStartDate)).inDays * _habitCounter} "
                          : "$_habitCounter times a week . Completed $_habitCounter/${DateTime.parse(_habitEndDate).difference(DateTime.parse(_habitStartDate)).inDays * _habitCounter}",
                      style: TextStyle(fontFamily: "AvertaStd", fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: DateTime.parse(_habitEndDate)
                  .difference(DateTime.parse(_habitStartDate))
                  .inDays,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        listOfDays[DateTime.parse(_habitStartDate)
                                    .add(Duration(days: index))
                                    .weekday -
                                1]
                            .toString(),
                        style: TextStyle(fontFamily: "AvertaStd", fontSize: 14),
                      ),
                      /*Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          child: Center(
                            child: Text(
                              "${_habitCounter * (index + 1)}/${DateTime.parse(_habitEndDate).difference(DateTime.parse(_habitStartDate)).inDays * _habitCounter}",
                              style: TextStyle(
                                  fontSize: 8.9, fontFamily: "AvertaStd"),
                            ),
                          )),*/
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: CircularStepProgressIndicator(
                          totalSteps: DateTime.parse(_habitEndDate)
                                  .difference(DateTime.parse(_habitStartDate))
                                  .inDays *
                              _habitCounter,
                          height: 40,
                          width: 40,
                          padding: 0,
                          stepSize: 2,
                          currentStep: _habitCounter * (index + 1),
                          selectedStepSize: 2,
                          selectedColor: Color(int.parse(_habitColor)),
                          unselectedColor: Colors.grey[200],
                          child: Center(
                              child: DateTime.now()
                                          .add(Duration(days: index))
                                          .weekday !=
                                      DateTime.parse(_habitStartDate)
                                          .add(Duration(days: index ))
                                          .weekday
                                  ? Text(
                                      " ${_habitCounter * (index + 1)}/${DateTime.parse(_habitEndDate).difference(DateTime.parse(_habitStartDate)).inDays * _habitCounter}",
                                      style: TextStyle(
                                          fontSize: 8.9,
                                          fontFamily: "AvertaStd"),
                                    )
                                  : Icon(
                                      Icons.check,
                                      color: Colors.deepOrange,
                                    )
                              /* : Icon(
                                    Icons.check,
                                    color: Colors.deepOrange,
                                  ),*/
                              ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _habitDay(BuildContext context) {
    return Container(
        height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
        ));
  }
}
