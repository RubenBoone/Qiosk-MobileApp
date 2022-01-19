import 'package:flutter/material.dart';

//This page shows a blueprint of the building with information about each kiosk
//This page will pop up whenever the app is launched
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: [
                const Text("Home",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(color: Colors.teal.shade700),
                ),
                const Text(
                  "...",
                  style: TextStyle(height: 1.3, fontSize: 20),
                )
              ],
            )));
  }
}
