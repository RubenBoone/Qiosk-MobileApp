import 'package:qiosk/apis/kiosk_api.dart';
import 'package:qiosk/models/user.dart';
import 'package:flutter/material.dart';
import 'package:qiosk/widgets/table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

//This page show a summary of the vistor's behaviour
class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  User? user;
  int id = 0;
  String token = "";

  @override
  Future<void> initState() async {
    super.initState();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt('userID') ?? 0;
      token = prefs.getString('token') ?? "";
    });
    _getUser(id); // get the user info using the api
  }

  void _getUser(int id) {
    KioskApi.fetchUser(id, token).then((result) {
      // call the api to fetch the user data
      setState(() {
        user = result;
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
                  Expanded(child: DataTable(
                    columns: <DataColumn>[
                      const DataColumn(
                        label: Text(
                          'Naam',
                          style: TextStyle(
                              color: Color(0xFF575757),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          user!.firstName,
                          style: const TextStyle(color: Color(0xFF575757)),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text('Email',
                              style: TextStyle(
                                  color: Color(0xFF575757),
                                  fontWeight: FontWeight.bold))),
                          DataCell(Text(user!.email,
                              style:
                                  const TextStyle(color: Color(0xFF575757)))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text('Bedrijf',
                              style: TextStyle(
                                  color: Color(0xFF575757),
                                  fontWeight: FontWeight.bold))),
                          DataCell(Text(user!.companyID.toString(),
                              style:
                                  const TextStyle(color: Color(0xFF575757)))),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  const MyTable()
                ]))));
  }
}
