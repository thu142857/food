import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentState {
  SharedPreferences _preferences;
  String email;
  String password;

  PersistentState(this._preferences)
  : email = _preferences.getString('email'),
    password = _preferences.getString('password'){
      //
  }

  setEmailData(String newEmail) {
    email = newEmail;
     _preferences.setString('email', newEmail);

  }
  setPasswordData(String newPassword) {
    password = newPassword;
     _preferences.setString('password', newPassword);

  }
  invalidateAuth(){
    email = null;
    password = null;
    _preferences.remove('email');
    _preferences.remove('password');
  }

}
