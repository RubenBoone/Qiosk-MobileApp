import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:qiosk/models/kiosk.dart';
import 'package:qiosk/models/timeperkiosk.dart';
import 'package:qiosk/models/userkiosk.dart';

class MyTable extends StatefulWidget {
  List<UserKiosk> userKiosks = [];
  List<Kiosk> kioskList = [];
  MyTable({Key? key, required this.userKiosks, required this.kioskList})
      : super(key: key);

  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  List<TimePerKiosk> timePerKioskList = [];

  @override
  void initState() {
    super.initState();
    _processKiosks();
  }

  _processKiosks() {
    List<int> usedNum = [];
    for (var userKiosk in widget.userKiosks) {
      if (!usedNum.contains(userKiosk.kioskID)) {
        timePerKioskList.add(TimePerKiosk(
            kioskID: userKiosk.kioskID,
            name: widget.kioskList[userKiosk.kioskID - 1].name,
            time: 0,
            percentage: 0.0));
        usedNum.add(userKiosk.kioskID);
      }
    }
    _calculateTime();
  }

  _calculateTime() {
    Duration totalTime = Duration();
    for (UserKiosk userKiosk in widget.userKiosks) {
      DateTime end = DateTime.parse(userKiosk.end);
      DateTime begin = DateTime.parse(userKiosk.begin);
      Duration time = Duration(
          hours: end.hour - begin.hour,
          minutes: end.minute - begin.minute,
          seconds: end.second - begin.second);

      for (TimePerKiosk kiosk in timePerKioskList) {
        if (kiosk.kioskID == userKiosk.kioskID) {
          kiosk.time = kiosk.time + int.parse(time.inMinutes.toString());
          print(kiosk.name + " " + kiosk.time.toString());
        }
      }
      totalTime = totalTime + time;
    }
    for (TimePerKiosk kiosk in timePerKioskList) {
      kiosk.percentage = kiosk.time / int.parse(totalTime.inMinutes.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _processKiosks();
    return Table(children: [
      for (TimePerKiosk kiosk in timePerKioskList)
        TableRow(children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(kiosk.name,
                  style: const TextStyle(
                      color: Color(0xFF575757), fontWeight: FontWeight.bold))),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                //width = MediaQuery.of(context).size.width - 300
                width: 120,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: kiosk.percentage,
                center: Text((kiosk.percentage * 100).toStringAsFixed(2) + "%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.orangeAccent,
              ))
        ])
    ]);
  }
}
