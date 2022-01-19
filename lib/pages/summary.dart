import 'package:flutter/material.dart';

//Deze pagina wordt gebruikt om de camera op in te laden
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
      body: Container(color: Colors.white),
    );
  }
}