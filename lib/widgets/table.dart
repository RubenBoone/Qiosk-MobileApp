import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyTable extends StatelessWidget {
  const MyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
        children: [
          TableRow(children: [
            const Text("Kiosk 1",
                style: TextStyle(
                    color: Color(0xFF575757), fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                //width = MediaQuery.of(context).size.width - 300
                width: 120,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.7,
                center: Text("70.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              )
            )
          ]),
          TableRow(children: [
            const Text("Kiosk 2",
                style: TextStyle(
                    color: Color(0xFF575757), fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                //width = MediaQuery.of(context).size.width - 300
                width: 120,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.25,
                center: Text("25.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              )
            )
          ]),
          TableRow(children: [
            const Text("Kiosk 3",
                style: TextStyle(
                    color: Color(0xFF575757), fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                //width = MediaQuery.of(context).size.width - 300
                width: 120,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.05,
                center: Text("5.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              )
            )
          ])
        ]);
  }
}
