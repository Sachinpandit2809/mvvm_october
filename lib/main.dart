import 'package:flutter/material.dart';
import 'package:mvvm_october/screen_controllers/auth_screen_controller.dart';
import 'package:mvvm_october/screen_controllers/user_session_controller.dart';
import 'package:mvvm_october/screens/login_screen.dart';
import 'package:mvvm_october/utils/routes/route_names.dart';
import 'package:mvvm_october/utils/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthScreenController(),
        ),
        ChangeNotifierProvider(create: (_) => UserSessionController())
      ],
      child: MaterialApp(
        title: 'mvvm_october',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
