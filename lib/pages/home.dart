import 'package:qiosk/main.dart';
import 'package:flutter/material.dart';

//This page shows a blueprint of the building with information about each kiosk
//This page will pop up whenever the app is launched
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE4E4E4),
        body: Container(
            padding: const EdgeInsets.all(5.0),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(primary: false, children: [
                  const Center(
                      child: Text("Home",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF575757)))),
                  const SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(color: Color(0XFFFF6A00))),
                  const Center(
                      child: Text("EXPERIENCE CENTER:",
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 20,
                              color: Color(0xFF575757)))),
                  const Center(
                      child: Text("ERVAAR DE MAGIE VAN IT" '\n',
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 20,
                              color: Color(0xFF575757)))),
                  const Center(
                      child: Text(
                    "Welkom in het Experience Center van Van Roey! In ons Experience Center zijn talloze toepassingen te ervaren en te aanschouwen om als bedrijf een digitale dynamiek op te bouwen."
                        '\n\n'
                        "Geen futuristische fictie van wat zou kunnen komen, wel een actieve en interactieve voorstelling van toekomstbestendige technologie die al marktmatuur is, voor democratische prijzen."
                        '\n',
                    style: TextStyle(
                        height: 1.3, fontSize: 15, color: Color(0xFF575757)),
                  )),
                  Center(
                    child: Image.asset(
                        'assets/images/engineerExperienceCenter.jpg'),
                  )
                ]))));
  }
}
