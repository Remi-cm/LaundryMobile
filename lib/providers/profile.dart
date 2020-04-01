import 'package:flutter/material.dart';

class UserProfileProvider with ChangeNotifier {
  int _id;
  String _name, _email, _token;

  UserProfileProvider(this._id, this._email, this._name, this._token);
  
  int get getId => _id;
  String get getName => _name;
  String get getEmail => _email;
  String get getToken => _token;

  void updateName(String newVal){
    _name = newVal;
    notifyListeners();
  }

  void updateEmail(String newVal){
    _email = newVal;
    notifyListeners();
  }

  void updateId(int newVal){
    _id = newVal;
    notifyListeners();
  }

  void updateToken(String newVal){
    _token = newVal;
    notifyListeners();
  }

}