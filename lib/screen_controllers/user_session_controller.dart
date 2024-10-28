import 'package:flutter/material.dart';
import 'package:mvvm_october/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSessionController with ChangeNotifier {
  // created a boolean function name saveUser
  // 
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("email", user.email.toString());
    notifyListeners();
    return true;
  }
}
