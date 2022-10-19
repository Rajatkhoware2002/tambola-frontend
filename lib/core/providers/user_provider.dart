// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  late User _user;
//  = User(name: "", language: "english", mobile: "", password: "");

  User get user => _user;

  void setUser(String user) {
    _user = userFromJson(user);
    print("set user success ${_user.user.id}");
    print(_user.user.username);
    notifyListeners();
    print(_user.user.mobile);
  }
}
