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
    return Center(
      child: Column(
        children: [
          const Text("Grondplan",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF575757))),
          const SizedBox(
              height: 20, width: 300, child: Divider(color: Color(0XFFFF6A00))),
          Image.asset("assets/images/Blueprint.png"),
          for (var kiosk in kioskList)
            Column(
              children: [Text(kiosk.name), Text(kiosk.description)],
            )
        ],
      ),
    );
  }

  _kioskListItems() {
    // FutureBuilder(
    //     future: KioskApi.fetchKiosks(),
    //   builder: (context, AsyncSnapshot snapshot) {
    //   if (!snapshot.hasData) {
    //     return const Center(child: CircularProgressIndicator());
    //   } else {
    //     return ListView.builder(
    //         itemCount: kioskList.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           return Text(kioskList[index].name);
    //         });
    //   }
    // });

    for (var kiosk in kioskList) {
      Text(kiosk.name);
    }
  }
}
