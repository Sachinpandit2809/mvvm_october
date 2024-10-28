import 'package:flutter/material.dart';
import 'package:mvvm_october/resource/components/round_button.dart';
import 'package:mvvm_october/screen_controllers/auth_screen_controller.dart';
import 'package:mvvm_october/utils/routes/route_names.dart';
import 'package:mvvm_october/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _onsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authScreenController = Provider.of<AuthScreenController>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
                decoration: const InputDecoration(
                    hintText: "email", prefixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ValueListenableBuilder(
                valueListenable: _onsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    onFieldSubmitted: (v) {},
                    obscureText: _onsecurePassword.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: InkWell(
                          onTap: () {
                            _onsecurePassword.value = !_onsecurePassword.value;
                          },
                          child: Icon(_onsecurePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(Icons.lock)),
                  );
                },
              ),
              SizedBox(
                height: height * 0.07,
              ),
              RoundButton(
                  loading: authScreenController.loginLoading,
                  title: "LOGIN",
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      Utils.toastErrorMessage("please enter email");
                    } else if (passwordController.text.isEmpty) {
                      Utils.toastErrorMessage("please enter password");
                    } else if (passwordController.text.length < 6) {
                      Utils.toastErrorMessage("password should be 6 digit ");
                    } else {
                      Utils.showFlushBarErrorMessage("Api hitted", context);
                      Map data = {
                        "email": emailController.text.toString(),
                        "password": passwordController.text.toString()
                      };
                      authScreenController.loginApi(data, context);
                    }
                  }),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.signup);
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(color: Colors.blue)))
                ],
              )
            ],
          ),
        ));
  }
}
