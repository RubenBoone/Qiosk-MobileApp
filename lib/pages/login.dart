import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:qiosk/apis/auth_api.dart';
import 'package:qiosk/encryption_service.dart';
import 'package:qiosk/models/userLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

//This page is shown when you need to log in
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    bool _passwordVisible = false;
    bool attempted = false;
    UserLogin userlogin = UserLogin(userID: 0, email: "", password: "", isActive: false,isAdmin: false,token: "");
    TextEditingController emailController= TextEditingController();
    TextEditingController passwordController= TextEditingController();
  @override
  void initState(){
   _passwordVisible = false;
   getData();
}
getData() async {
   // get data from shared_preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    userlogin.userID = prefs.getInt('userID')??0;
    userlogin.email = prefs.getString('email')??"";
    userlogin.isActive = prefs.getBool('isActive')??false;
    userlogin.isAdmin= prefs.getBool('isAdmin')??false;
    userlogin.token = prefs.getString('token')??"";
  });
}
String? get _errorText {
  if (attempted && userlogin.token=="") {
    return 'Email of wachtwoord is onjuist';
  }
  // return null
  return null;
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
                            decoration: const InputDecoration(
                                labelText: 'Email'))),
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: passwordController,
                            obscureText: !_passwordVisible,//This will obscure text dynamically
                            decoration: InputDecoration(
                                labelText: 'Wachtwoord',
                                // Here is key idea
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible                                     ? Icons.visibility
                                          : Icons.visibility_off,
                                          color: Theme.of(context).primaryColorDark,
                                          ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                              _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                  ),errorText: _errorText
                                    )
                                   )
                                ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Center(
                        child: ElevatedButton(
                            onPressed: () {_login();},
                            child: const Text('Inloggen'),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0XFFFF6A00),
                              shadowColor: const Color(0XFF575757),
                            ))))
                  ],
                ))));
  }
   // ________ FUNCTIONS ________ //

  void _login() {
    userlogin.email= emailController.text.trim();
    userlogin.password=encrypt(passwordController.text.trim());
    AuthApi.authenticate(userlogin).then((result) async {
      // call the api to 
      if (mounted) {
         SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(()  {
          userlogin = result;
         
          prefs.setInt('userID', userlogin.userID);
          prefs.setString('email', userlogin.email);
          prefs.setBool('isActive', userlogin.isActive);
          prefs.setBool('isAdmin', userlogin.isAdmin);
          prefs.setString('token', userlogin.token);
 
          attempted==true;
          print("ingelogd");
          
        });
      }
    }
    );
    if(userlogin.userID==-1){
      attempted=true;
    }
  }
}
