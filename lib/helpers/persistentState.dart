import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentState {
  String username;
  String password;

  PersistentState(
      {@required this.username, this.password});

  PersistentState.fromAppState(PersistentState another) {
    username = another.username;
    password = another.password;
  }
  String get viewUsername =>username;
  
  LoginPersis() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = (prefs.getString('username') ?? null);
  String password = (prefs.getString('password') ?? null);
  await prefs.setString('username', username);
  await prefs.setString('password', password);
}
}
