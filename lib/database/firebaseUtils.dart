import 'dart:async';


import 'package:firebase_database/firebase_database.dart';
import 'package:habtrack/data/User.dart';

class FirebaseUtils {
  DatabaseReference _userRef;
  StreamSubscription<Event> _messageSubscription;
  FirebaseDatabase _database = new FirebaseDatabase();
  DatabaseError error;


  static final FirebaseUtils _instance = new FirebaseUtils.internal();

  FirebaseUtils.internal();

  factory FirebaseUtils() {
    return _instance;
  }

  void initState() {
    _userRef = _database.reference().child("Users");
    _database.setPersistenceEnabled(true);
    _database.setPersistenceCacheSizeBytes(1024 * 10000000);
  }

  DatabaseError getError() {
    return error;
  }

  DatabaseReference getDatabaseRef() {
    return _userRef;
  }


  addUser(Users user) async {
    _userRef.push().set(<String, String>{
      "name": user.name,
      "email": user.email,
    }).then((_) => print("Use added successful"));
  }
  getUserDetail(){

  }

  void deleteUser(Users user) async {
    _userRef.child(user.id).remove().then((_) => print("user deleted "));
  }

  void updateUser(Users user) async {
    var updateValue = Map<String, String>();
    updateValue.putIfAbsent("name", user.name);
    updateValue.putIfAbsent("email", user.email);

    await _userRef.child(user.id).update(updateValue).then((_) =>
        print("User update successfully"));
  }
  void dispose(){
    _messageSubscription.cancel();
  }
}
