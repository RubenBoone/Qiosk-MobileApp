import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qiosk/models/user.dart';

class MyDataTable extends StatelessWidget {
  late User user;

  MyDataTable({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        const DataColumn(
          label: Text(
            'Voornaam',
            style: TextStyle(
                color: Color(0xFF575757), fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            user.firstName,
            style: const TextStyle(color: Color(0xFF575757)),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            const DataCell(Text('Achternaam',
                style: TextStyle(
                    color: Color(0xFF575757), fontWeight: FontWeight.bold))),
            DataCell(Text(user.lastName,
                style: const TextStyle(color: Color(0xFF575757)))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            const DataCell(Text('Email',
                style: TextStyle(
                    color: Color(0xFF575757), fontWeight: FontWeight.bold))),
            DataCell(Text(user.email,
                style: const TextStyle(color: Color(0xFF575757)))),
          ],
        ),
      ],
    );
  }
}
