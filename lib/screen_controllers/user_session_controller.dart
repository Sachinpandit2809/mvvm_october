import 'package:flutter/material.dart';
import 'package:mvvm_october/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSessionController with ChangeNotifier {
  // created a boolean function name saveUser
  // created an object of sharedPreferences for initialiasation
  // then called a finction setString for store the credential for session and future requests
  // then notified
  // return true

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("email", user.email.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? email = sp.getString("email");
    return UserModel(email: email);
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("email");
    notifyListeners();
    return true;
  }
}
