import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../main.dart';

//This page shows a blueprint of the building
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                      child: Text("Kiosk toevoegen",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF575757)))),
                  const SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(color: Color(0XFFFF6A00))),
                  Center(
                      child: RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  height: 1.3,
                                  fontSize: 15,
                                  color: Color(0xFF575757),
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                        TextSpan(text: "Om een kiosk toe te voegen: "),
                        TextSpan(
                          text:
                              'Ga op elk hoekpunt van de te meten zone rond de kiosk staan en vul de coördinaten in.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ]))),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Kiosknaam'))),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Beschrijving'))),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    SizedBox(
                        width: 150,
                        child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Linkerbovenhoek'))),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('Stel hoekpunt in'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFFFF6A00),
                          shadowColor: const Color(0XFF575757),
                        ))
                  ]),
                  Row(children: [
                    SizedBox(
                        width: 150,
                        child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Rechterbovenhoek'))),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('Stel hoekpunt in'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFFFF6A00),
                          shadowColor: const Color(0XFF575757),
                        ))
                  ]),
                  Row(children: [
                    SizedBox(
                        width: 150,
                        child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Rechteronderhoek'))),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('Stel hoekpunt in'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFFFF6A00),
                          shadowColor: const Color(0XFF575757),
                        ))
                  ]),
                  Row(children: [
                    SizedBox(
                        width: 150,
                        child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Linkeronderhoek'))),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('Stel hoekpunt in'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFFFF6A00),
                          shadowColor: const Color(0XFF575757),
                        ))
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                        onPressed: () {},
                        child: const Text('Voeg kiosk toe'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFFFF6A00),
                          shadowColor: const Color(0XFF575757),
                        ))
                ]))));
  }
}
