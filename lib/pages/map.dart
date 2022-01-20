import 'package:Qiosk/pages/login.dart';
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
            padding: const EdgeInsets.all(5.0),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
            child: ListView(
              children: const [
                Center(
                    child: Text("Grondplan",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF575757)))),
                SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(color: Color(0XFFFF6A00))),
                SizedBox(
                  height: 50,
                )
              ]
            )));
  }
}
