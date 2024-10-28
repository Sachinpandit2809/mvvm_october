import 'package:flutter/material.dart';
import 'package:mvvm_october/screens/home_screen.dart';
import 'package:mvvm_october/screens/login_screen.dart';
import 'package:mvvm_october/screens/signup_screen.dart';
import 'package:mvvm_october/utils/routes/route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
     case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Routes Define"),
            ),
          );
        });
    }
  }
}
