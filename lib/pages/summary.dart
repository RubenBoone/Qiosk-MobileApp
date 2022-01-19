import 'package:flutter/material.dart';

//This page show a summary of the vistor's behaviour
class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Overzicht"),
        ),
        body: Container(
            color: Colors.white,
            child: Column(
              children: const [
                Text("Kiosk 1",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(
                  "Kiosk 2",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            )));
  }
}
