import 'package:firebase_database/firebase_database.dart';

class Users{
  String _id, _name, _email;

  Users(this._id, this._name, this._email);

  Users.fromSnapShot(DataSnapshot dataSnapshot){
    _id = dataSnapshot.key;
    _name = dataSnapshot.value['name'];
    _email = dataSnapshot.value['email'];
  }



  get email => _email;

  set email(value) {
    _email = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}