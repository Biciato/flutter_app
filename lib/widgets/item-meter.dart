import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ItemMeter extends StatelessWidget {
  const ItemMeter(this._meter, this._itemTitle, this._percent);


  final String _meter;
  final String _itemTitle;
  final double _percent;

  @override
  Widget build(BuildContext context) =>
    Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(_meter),
            Text(_itemTitle)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black)
          ),
          child: LinearPercentIndicator(
            percent: _percent,
            backgroundColor: Colors.white,
            progressColor: const Color(0xFFF58634)
          )
        )
      ],
    );
}