import 'package:flutter/material.dart';
import 'package:qiosk/encryption_service.dart';
import 'package:qiosk/models/userlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

//This page is shown when you need to log in
// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  Future Function() onLogin;
  LoginPage({Key? key, required this.onLogin}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  bool attempted = false;
  UserLogin userlogin = UserLogin(
      userID: 0,
      email: "",
      password: "",
      isActive: false,
      isAdmin: false,
      token: "");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMsg = "";
  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
    getData();
  }

  getData() async {
    // get data from shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userlogin.userID = prefs.getInt('userID') ?? 0;
      userlogin.email = prefs.getString('email') ?? "";
      userlogin.isActive = prefs.getBool('isActive') ?? false;
      userlogin.isAdmin = prefs.getBool('isAdmin') ?? false;
      userlogin.token = prefs.getString('token') ?? "";
      attempted = prefs.getBool('attemptedLogin') ?? false;
      emailController.text = prefs.getString('email') ?? "";
    });
  }

  _errorText() {
    setState(() {
      errorMsg = 'Email en/of wachtwoord is onjuist';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE4E4E4),
        body: Container(
            padding: const EdgeInsets.all(5.0),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  primary: false,
                  children: [
                    //Image.asset('assets/images/header.png'),
                    Center(
                      child: Image.asset('assets/images/qiosk.png'),
                    ),
                    const Center(
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 40, color: Color(0xFF575757)))),
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                            controller: emailController,
                            decoration:
                                const InputDecoration(labelText: 'Email'))),

                    SizedBox(
                        width: 300,
                        child: TextFormField(
                            controller: passwordController,
                            obscureText:
                                !_passwordVisible, //This will obscure text dynamically
                            decoration: InputDecoration(
                              labelText: 'Wachtwoord',
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ))),
                    if (errorMsg != "")
                      Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            errorMsg,
                            style: const TextStyle(color: Colors.red),
                          )),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (emailController.text.trim() == "" ||
                                      passwordController.text.trim() == "") {
                                    _errorText();
                                    return;
                                  }
                                  _login();
                                },
                                child: const Text('Inloggen'),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0XFFFF6A00),
                                  shadowColor: const Color(0XFF575757),
                                ))))
                  ],
                ))));
  }
  // ________ FUNCTIONS ________ //

  _login() async {
    userlogin.email = emailController.text.trim();
    userlogin.password = encrypt(passwordController.text.trim());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('email', userlogin.email);
      prefs.setString('password', userlogin.password);
    });

    widget.onLogin();

    await Future.delayed(const Duration(seconds: 2));

    if (prefs.getString('token') == "1") {
      setState(() {
        errorMsg = "Email en/of wachtwoord is onjuist";
      });
    }
  }
}
