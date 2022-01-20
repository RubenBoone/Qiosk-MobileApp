import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  const MyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Naam',
            style: TextStyle(
                color: Color(0xFF575757), fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'NAME',
            style: TextStyle(
                color: Color(0xFF575757)),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bedrijf', style: TextStyle(color: Color(0xFF575757), fontWeight: FontWeight.bold))),
            DataCell(
                Text('COMPANY', style: TextStyle(color: Color(0xFF575757)))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Datum', style: TextStyle(color: Color(0xFF575757), fontWeight: FontWeight.bold))),
            DataCell(Text('DATE', style: TextStyle(color: Color(0xFF575757)))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Tijdstip', style: TextStyle(color: Color(0xFF575757), fontWeight: FontWeight.bold))),
            DataCell(Text('START-END', style: TextStyle(color: Color(0xFF575757)))),
          ],
        ),
      ],
    );
  }
}
