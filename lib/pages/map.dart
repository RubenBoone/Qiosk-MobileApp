import 'package:Qiosk/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../main.dart';

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
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(children: [
                  const Center(
                      child: Text("Grondplan",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF575757)))),
                  const SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(color: Color(0XFFFF6A00))),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset('assets/images/Blueprint.png'),
                  ),
                  const Center(
                    child: ListTile(
                      title: Text("Kiosk 1"),
                      subtitle: Text("Hier vind je van alles over drones"),
                    ),
                  ),
                  const Center(
                    child: ListTile(
                      title: Text("Kiosk 2"),
                      subtitle: Text("Deze kiosk geeft een voorbeeld van ..."),
                    ),
                  )
                ]))));
  }
}
