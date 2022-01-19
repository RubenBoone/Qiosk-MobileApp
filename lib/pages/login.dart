import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
            child: Column(
          children: [
            //Image.asset('assets/images/header.png'),
            Center(
              child: Image.asset('assets/images/qiosk.png'),
            ),
            Text("Login",
                style: TextStyle(fontSize: 40, color: Color(0xFF575757))),
            Container(
                width: 300,
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Gebruikersnaam'))),
            Container(
                width: 300,
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Wachtwoord'))),
            Container(
                margin: EdgeInsets.only(left: 55, top: 10),
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: Text('Inloggen'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0XFFFF6A00),
                      shadowColor: Color(0XFF575757),
                    )))
          ],
        )));
  }
}
