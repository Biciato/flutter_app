import 'package:flutter/material.dart';

class DiaryDetailsMedication extends StatefulWidget {
  @override
  DiaryDetailsMedicationState createState() => DiaryDetailsMedicationState();
}

class DiaryDetailsMedicationState extends State<DiaryDetailsMedication> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              Icon(Icons.colorize),
              Text('Medicação')
            ]
          ),
          const Text('Nome do remédio'),
          Row(
            children: const <Widget>[
              Text('Dosagem:'),
              Text('Horário:')
            ]
          ),
          Row(
            children: const <Widget>[
              Text('50ml'),
              Text('14h15 | 18h00')
            ]
          )
        ]
      )
    );
  }
}