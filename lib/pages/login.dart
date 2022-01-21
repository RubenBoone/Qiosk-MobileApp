import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../main.dart';

//This page is shown when you need to log in
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                            decoration: const InputDecoration(
                                labelText: 'Gebruikersnaam'))),
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Wachtwoord'))),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Inloggen'),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0XFFFF6A00),
                              shadowColor: const Color(0XFF575757),
                            ))))
                  ],
                ))));
  }
}
