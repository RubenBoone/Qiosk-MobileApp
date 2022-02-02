import 'package:qiosk/apis/kiosk_api.dart';
import 'package:qiosk/models/kiosk.dart';
import 'package:qiosk/models/user.dart';
import 'package:qiosk/models/userkiosk.dart';
import 'package:qiosk/widgets/datatable.dart';
import 'package:qiosk/widgets/table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

//This page show a summary of the vistor's behaviour
class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  User user = User(
      companyID: 0,
      email: "",
      firstName: "",
      isActive: false,
      isAdmin: false,
      lastName: "",
      userID: 0,
      password: "");
  late SharedPreferences prefs;
  int id = 0;
  String token = "";
  List<UserKiosk> userKiosks = [];
  List<Kiosk> kioskList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt('userID')!;
      token = prefs.getString('token')!;
    });
    _getUser(id, token);
    _getUserKiosks(id, token);
    _getKiosks();
  }

  void _getUser(id, token) async {
    await KioskApi.fetchUser(id, token).then((result) {
      setState(() {
        user = result;
      });
    });
  }

  void _getUserKiosks(userid, token) async {
    await KioskApi.fetchUserKiosk(userid, token).then((result) {
      setState(() {
        userKiosks = result;
      });
    });
  }

  void _getKiosks() {
    KioskApi.fetchKiosks().then((result) {
      setState(() {
        kioskList = result;
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
                child: ListView(children: [
                  const Center(
                      child: Text("Bezoekersrapport",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF575757)))),
                  const SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(color: Color(0XFFFF6A00))),
                  MyDataTable(user: user),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTable(userKiosks: userKiosks, kioskList: kioskList)
                ]))));
  }
}
