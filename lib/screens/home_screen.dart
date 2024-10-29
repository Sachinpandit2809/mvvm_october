import 'package:flutter/material.dart';
import 'package:mvvm_october/screen_controllers/user_session_controller.dart';
import 'package:mvvm_october/utils/routes/route_names.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserSessionController>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              userPreferences.removeUser();
              Navigator.pushNamed(context, RouteNames.login);
            },
            child: Icon(Icons.logout),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(child: Text("Home Screen")),
    );
  }
}
