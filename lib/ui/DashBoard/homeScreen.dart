import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habtrack/data/habit_item.dart';
import 'package:habtrack/database/localDatabaseUtils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = new DataBaseHelper();
  List<HabitItem> _itemList = <HabitItem>[];
  bool isItemEmptyList = false;

  SlidableController _slidableController;

  @override
  void initState() {
    super.initState();
    _getHabitCount();
    _readHabitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F5FC),
        body: MediaQuery(
            data: MediaQueryData.fromWindow(ui.window),
            child: welcomeNote(context))

        /*Column(
        mainAxisSize: MainAxisSize.max,

        children: <Widget>[welcomeNote(context)],
      ),*/
        );
  }

  Widget welcomeNote(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 90,
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              "Hi, Ifeanyi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            )),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "How are you feeling today?",
              style: TextStyle(fontSize: 18),
            )),
        /* SizedBox(
          height: 200,
        ),*/
        Visibility(
          visible: isItemEmptyList,
          child: itemListBuilder(context),
          replacement: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 200),
              child: Text(
                "There are no habits yet. \nTap + button to add your first habit",
                style: TextStyle(fontSize: 18, height: 1.5),
              )),
        ),
      ],
    );
  }

  Widget itemListBuilder(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          reverse: true,
          shrinkWrap: true,
          itemCount: _itemList.length,
          itemBuilder: (context, int index) {
            return Container(
              child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  shadowColor: Colors.grey,
                  elevation: 1,
                  child: Slidable(
                    actionPane: SlidableBehindActionPane(),
                    direction: Axis.horizontal,
                    controller: _slidableController,
                    actionExtentRatio: 0.25,
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        title: _itemList[index],
                      ),
                    ),
                   /* actions: <Widget>[
                      IconSlideAction(
                        icon: Icons.delete,
                        color: Colors.red,
                        onTap: () {},
                        caption: "Delete",
                      ),
                      IconSlideAction(
                        icon: Icons.edit,
                        color: Colors.blue,
                        onTap: () {},
                        caption: "Edit",
                      ),
                    ],*/
                    secondaryActions: <Widget>[

                      IconSlideAction(
                        icon: Icons.delete,
                        color: Colors.red,
                        onTap: () {},
                        caption: "Delete",
                      ),
                      IconSlideAction(
                        icon: Icons.edit,
                        color: Colors.blue,
                        onTap: () {},
                        caption: "Edit",
                      ),
                    ],
                  )

                  /* ListTile(
                      title: _itemList[index], onTap: () {

                    },
                    ),*/
                  ),
            );
          }),
    ));
  }

  _readHabitData() async {
    List items = await db.getAllHabit();
    items.forEach((item) {
      setState(() {
        _itemList.add(HabitItem.map(item));
        print(_itemList.length);
      });
    });
  }

  _getHabitCount() async {
    var count = await db.habitCount();
    print("Helloooo Count $count");
    if (count > 0) {
      setState(() {
        isItemEmptyList = true;
      });
    } /*else isItemEmptyList =false;*/
  }
}
