import 'package:flutter/material.dart';
import 'package:mvvm_october/resource/components/round_button.dart';
import 'package:mvvm_october/screen_controllers/auth_screen_controller.dart';
import 'package:mvvm_october/utils/routes/route_names.dart';
import 'package:mvvm_october/utils/utils.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ValueNotifier<bool> _onsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode usernameFocusNode = FocusNode();
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    usernameController.dispose();
    usernameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authScreenController = Provider.of<AuthScreenController>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Signup"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: usernameController,
                  focusNode: usernameFocusNode,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, usernameFocusNode, passwordFocusNode);
                  },
                  decoration: const InputDecoration(
                      hintText: "username", prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                TextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, emailFocusNode);
                  },
                  decoration: const InputDecoration(
                      hintText: "email", prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: height * 0.04,
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
                              _onsecurePassword.value =
                                  !_onsecurePassword.value;
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
                    title: "SIGN UP",
                    onPress: () {
                      if (emailController.text.isEmpty) {
                        Utils.toastErrorMessage("please enter email");
                      } else if (passwordController.text.isEmpty) {
                        Utils.toastErrorMessage("please enter password");
                      } else if (passwordController.text.length < 6) {
                        Utils.toastErrorMessage("password should be 6 digit ");
                      } else {
                        // Utils.showFlushBarErrorMessage("Api hitted", context);
                        Map data = {
                          "username": usernameController.text.toString(),
                          "email": emailController.text.toString(),
                          "password": passwordController.text.toString()
                        };
                        authScreenController.signupApi(data, context);
                      }
                    }),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Allready have an account?"),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.login);
                        },
                        child: const Text("Login",
                            style: TextStyle(color: Colors.blue)))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
