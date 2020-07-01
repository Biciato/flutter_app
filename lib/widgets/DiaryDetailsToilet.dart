import 'package:aldeia_montessori/widgets/item-meter.dart';
import 'package:flutter/material.dart';

class DiaryDetailsToilet extends StatefulWidget {
  @override
  DiaryDetailsToiletState createState() => DiaryDetailsToiletState();
}

class DiaryDetailsToiletState extends State<DiaryDetailsToilet> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget>[
              Row(
                  children: const <Widget>[
                    Icon(Icons.airline_seat_legroom_extra),
                    Text('Banheiro')
                  ]
              ),
              Column(
                  children: const <Widget>[
                    ItemMeter('Normal', '', 0.25),
                    ItemMeter('Pastoso', '', 0.5),
                    ItemMeter('Normal', '', 0.25),
                  ]
              )
            ]
        )
    );
  }
}