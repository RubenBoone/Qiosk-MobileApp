import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//This page shows a blueprint of the building
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
