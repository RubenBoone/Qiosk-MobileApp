import 'package:flutter/material.dart';
import 'package:qiosk/apis/kiosk_api.dart';
import 'package:qiosk/models/kiosk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

//This page shows a blueprint of the building
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Kiosk kiosk = Kiosk(name: "", description: "", kioskID: 0, coordinate: "");
  String token = "";
  String errorMsg = "";
  String successMsg = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController xCoordController = TextEditingController();
  TextEditingController yCoordController = TextEditingController();
  TextEditingController radiusController = TextEditingController();

  _saveKiosk() {
    bool valid = true;
    setState(() {
      errorMsg = errorMsg + "";
      successMsg = "";
    });
    kiosk.name = nameController.text;
    kiosk.description = descriptionController.text;

    try {
      int.parse(xCoordController.text);
      int.parse(yCoordController.text);
      int.parse(radiusController.text);

      if (nameController.text == "" || descriptionController.text == "") {
        setState(() {
          errorMsg = "Vul de naam en beschrijving in.";
          successMsg = "";
          valid = false;
        });
      }
    } catch (e) {
      setState(() {
        if (nameController.text == "" || descriptionController.text == "") {
          errorMsg =
              "Vul de naam en beschrijving in en X-coördinaat, Y-coördinaat en radius moeten een getal / ingevuld zijn.";
        } else {
          errorMsg =
              "X-coördinaat, Y-coördinaat en radius moeten een getal / ingevuld zijn.";
          successMsg = "";
        }
        valid = false;
      });
    }

    if (!valid) {
      return;
    }

    setState(() {
      errorMsg = "";
      successMsg = "Kiosk toegevoegd!";
    });

    kiosk.coordinate = int.parse(xCoordController.text).toString() +
        "," +
        yCoordController.text +
        "," +
        radiusController.text;

    if (valid) KioskApi.postKiosk(kiosk, token).then((result) {});
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
                              'Geef het middelpunt van de kiosk in met een radius',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ]))),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              labelText: 'Naam van kiosk'))),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              labelText: 'Beschrijving van kiosk'))),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: xCoordController,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: false,
                          decoration: const InputDecoration(
                              labelText: 'X-cöordinaat'))),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: yCoordController,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: false,
                          decoration: const InputDecoration(
                              labelText: 'Y-cöordinaat'))),
                  SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: radiusController,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: false,
                          decoration:
                              const InputDecoration(labelText: 'Radius'))),
                  const SizedBox(
                    height: 20,
                  ),
                  if (successMsg != "")
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          successMsg,
                          style: const TextStyle(color: Colors.green),
                        )),
                  if (errorMsg != "")
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          errorMsg,
                          style: const TextStyle(color: Colors.red),
                        )),
                  ElevatedButton(
                      onPressed: () {
                        _saveKiosk();
                      },
                      child: const Text('Voeg kiosk toe'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFFFF6A00),
                        shadowColor: const Color(0XFF575757),
                      ))
                ]))));
  }
}
