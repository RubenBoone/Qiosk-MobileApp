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
        body: Container(
            padding: const EdgeInsets.all(5.0),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Expanded(child: ListView(children: [
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
                  Center(child: SizedBox(child: _kioskListItems()))
                ])))));
  }

  _kioskListItems() {
    FutureBuilder(
        future: KioskApi.fetchKiosks(),
      builder: (context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
            itemCount: kioskList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(kioskList[index].name);
            });
      }
    });
  }
}