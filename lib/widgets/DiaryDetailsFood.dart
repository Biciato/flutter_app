import 'package:aldeia_montessori/widgets/item-meter.dart';
import 'package:flutter/material.dart';

class DiaryDetailsFood extends StatefulWidget {
  @override
  DiaryDetailsFoodState createState() => DiaryDetailsFoodState();
}

class DiaryDetailsFoodState extends State<DiaryDetailsFood> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              Icon(Icons.restaurant),
              Text('Alimentação')
            ]
          ),
          Column(
            children: const <Widget>[
              ItemMeter('Bem', 'Colação', 0.75),
              ItemMeter('Muito Bem', 'Almoço', 1),
              ItemMeter('Metade', 'Lanche', 0.5),
              ItemMeter('Recusou', 'Janta', 0)
            ]
          )
        ]
      )
    );
  }
}