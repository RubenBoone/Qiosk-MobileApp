import 'package:qiosk/models/kiosk.dart';
import 'package:flutter/material.dart';
import 'package:qiosk/apis/kiosk_api.dart';

import '../main.dart';

//This page shows a blueprint of the building
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Kiosk> kioskList = [];
  int count = 0;

  @override
  void initState() {
    super.initState();
    _getKiosks();
  }

  void _getKiosks() {
    KioskApi.fetchKiosks().then((result) {
      setState(() {
        kioskList = result;
        count = result.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE4E4E4),
        body: Center(
          child: Column(
            children: [
              const Text("Grondplan",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF575757))),
              const SizedBox(
                  height: 20,
                  width: 300,
                  child: Divider(color: Color(0XFFFF6A00))),
              Image.asset("assets/images/Blueprint.png"),
              const Text("Kiosken",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF575757))),
              const SizedBox(
                  height: 20,
                  width: 300,
                  child: Divider(color: Color(0XFFFF6A00))),
              for (var kiosk in kioskList)
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          children: [
                            Text(
                              kiosk.name,
                              style: const TextStyle(fontSize: 24),
                            ),
                            Text(kiosk.description)
                          ],
                        ))
                  ],
                )
            ],
          ),
        ));
  }
}
