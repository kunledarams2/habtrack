import 'dart:async';
import 'dart:io';

import 'package:habtrack/data/habit_item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = new DataBaseHelper.internal();

  factory DataBaseHelper() => _instance;

  /* String _habitName;
  Widget _habitIcon;
  Widget _habitColor;
  String _habitType;
  int  _habitCounter;*/

  final String habitTable = "habitTable";
  final String columnId = "id";
  final String columnHabitName = "habitName";
  final String columnHabitCounter = "habitCounter";
  final String columnHabitType = "habitType";
  final String columnHabitIcon = "habitIcon";
  final String columnHabitIconFamily = "habitIconFamily";
  final String columnHabitIconPackageName = "habitIconPackageName";
  final String columnHabitColor = "habitColor";
  final String columnHabitStartDate = "habitStartDate";
  final String columnHabitEndDate = "habitEndDate";
  static Database _db;

  DataBaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path =
        join(directory.path, "habHack2.db"); // home://directory/files/habHack.db

    var habDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return habDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $habitTable($columnId INTEGER PRIMARY KEY,"
            " $columnHabitName TEXT, $columnHabitType TEXT, $columnHabitCounter, $columnHabitColor TEXT, $columnHabitIcon TEXT,"
            " $columnHabitIconFamily TEXT, $columnHabitIconPackageName TEXT, $columnHabitStartDate TEXT, $columnHabitEndDate TEXT )");
  }

  // insertion
  Future<int> saveHabit(HabitItem habitItem) async {
    var dbClient = await db;
    int res = await dbClient.insert("$habitTable", habitItem.toMap());
    return res;
  }

  // get all habit
  Future<List> getAllHabit() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $habitTable");
    return result.toList();
  }

  // total habit count

  Future<int> habitCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $habitTable"));
  }

  Future<HabitItem> getHabit(int id) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $habitTable WHERE $columnId = $id");
    if (result.length == 0) return null;
    return new HabitItem.fromMap(result.first);
  }

  Future<int> deleteHabit(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete("$habitTable", where: "$columnId= ?", whereArgs: [id]);
  }

  Future<int> updateHabit(HabitItem habitItem) async {
    var dbClient = await db;
    return await dbClient.update("$habitItem", habitItem.toMap(),
        where: "$columnId = ?", whereArgs: [habitItem.id]);
  }

  Future close() async{
    var dbClient = await db;
    return dbClient.close();
  }
}
