import 'package:flutter/material.dart';
import 'package:mvvm_october/model/user_model.dart';
import 'package:mvvm_october/screen_controllers/user_session_controller.dart';
import 'package:mvvm_october/screens/home_screen.dart';
import 'package:mvvm_october/screens/login_screen.dart';
import 'package:mvvm_october/utils/routes/route_names.dart';
import 'package:mvvm_october/utils/routes/routes.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserSessionController().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      debugPrint(value.email.toString());
      if (value.email.toString() == "null" || value.email == '') {
        await Future.delayed(Duration(seconds: 4));
        // UserSessionController().saveUser(value);
        // Navigator.pushNamed(context, RouteNames.login);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        await Future.delayed(Duration(seconds: 4));

        // Navigator.pushNamed(context, RouteNames.home);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }).onError(
      (error, stackTrace) {
        debugPrint(error.toString());
      },
    );
  }
}
