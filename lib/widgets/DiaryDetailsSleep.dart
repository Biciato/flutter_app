import 'package:aldeia_montessori/widgets/item-meter.dart';
import 'package:flutter/material.dart';

class DiaryDetailsSleep extends StatefulWidget {
  @override
  DiaryDetailsSleepState createState() => DiaryDetailsSleepState();
}

class DiaryDetailsSleepState extends State<DiaryDetailsSleep> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget>[
              Row(
                  children: const <Widget>[
                    Icon(Icons.airline_seat_individual_suite),
                    Text('Sono')
                  ]
              ),
              Column(
                  children: const <Widget>[
                    ItemMeter('Manhã', '', 0.40),
                  ]
              )
            ]
        )
    );
  }
}