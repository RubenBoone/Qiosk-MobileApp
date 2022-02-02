import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:qiosk/apis/kiosk_api.dart';
import 'package:qiosk/models/kiosk.dart';
import 'package:qiosk/models/userkiosk.dart';

class MyTable extends StatelessWidget {
  List<UserKiosk> userKiosks;
  List<Kiosk> kioskList;
  int id = 0;
  String token = "";
  List timePerKiosk = [];
  List percentage = [];
  MyTable({Key? key, required this.userKiosks, required this.kioskList})
      : super(key: key);

  void _processKiosks() {
    Duration totalTime = Duration();
    for (UserKiosk kiosk in userKiosks) {
      DateTime end = DateTime.parse(kiosk.end);
      DateTime begin = DateTime.parse(kiosk.begin);
      Duration time = Duration(
          hours: end.hour - begin.hour,
          minutes: end.minute - begin.minute,
          seconds: end.second - begin.second);
      timePerKiosk.add(int.parse(time.inMinutes.toString()));
      totalTime = totalTime + time;
    }

    for (var item in timePerKiosk) {
      percentage.add(item / int.parse(totalTime.inMinutes.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _processKiosks();
    return Table(children: [
      for (var i = 0; i < userKiosks.length; i++)
        TableRow(children: [
          Text(kioskList[userKiosks[i].kioskID - 1].name.toString(),
              style: const TextStyle(
                  color: Color(0xFF575757), fontWeight: FontWeight.bold)),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                //width = MediaQuery.of(context).size.width - 300
                width: 120,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: percentage[i],
                center: Text((percentage[i]).toStringAsFixed(2) + "%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ))
        ])
    ]);
  }
}
