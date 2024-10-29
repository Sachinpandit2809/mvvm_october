import 'package:flutter/material.dart';
import 'package:mvvm_october/model/user_model.dart';
import 'package:mvvm_october/repository/auth_repository.dart';
import 'package:mvvm_october/screen_controllers/user_session_controller.dart';
import 'package:mvvm_october/utils/routes/route_names.dart';
import 'package:mvvm_october/utils/utils.dart';
import 'package:provider/provider.dart';

class AuthScreenController with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoginLoading(true);
    _myRepo.login(data).then((onValue) {
      debugPrint(onValue.toString());
      final userPreference =
          Provider.of<UserSessionController>(context, listen: false);
      userPreference.saveUser(UserModel(
        email: onValue['email'].toString(),
      ));
      Utils.toastSuccessMessage(onValue['message'].toString());
      Navigator.pushNamed(context, RouteNames.home);
      setLoginLoading(false);
    }).onError(
      (error, stackTrace) {
        setLoginLoading(false);

        if (error.toString() == '{"message":"User not found"}invalid request') {
          Utils.toastErrorMessage("please enter correct email");
        } else if (error.toString() ==
            '{"message":"Invalid credentials"}invalid request') {
          Utils.toastErrorMessage('wrong password');
        }
      },
    );
  }

// sign up controller
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setsignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setsignUpLoading(true);
    _myRepo.signUp(data).then((onValue) {
      debugPrint(onValue.toString());
      Utils.toastSuccessMessage(onValue['message'].toString());
      Navigator.pushNamed(context, RouteNames.home);
      setsignUpLoading(false);
    }).onError(
      (error, stackTrace) {
        setsignUpLoading(false);
        debugPrint(error.toString());
        if (error.toString() == 'null{"message":"User already exists"}') {
          Utils.toastErrorMessage("User already exists");
        }
        // Utils.toastErrorMessage(error.toString());
      },
    );
  }
}
