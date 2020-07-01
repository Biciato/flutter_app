import 'package:flutter/material.dart';

const String message = 'Vivamus viverra arcu lorem, vitae aliquet lorem gravida id. In libero lectus, sceleris id urna quis, rutrum placerat augue. Vestibelo dignissim, sem vel tempor posuere, urna justo viverra dui, sceleri fringilla mets.';
const String messageSender = 'Luiz de Campos';

class DiaryDetailsMessage extends StatefulWidget {
  @override
  DiaryDetailsMessageState createState() => DiaryDetailsMessageState();
}

class DiaryDetailsMessageState extends State<DiaryDetailsMessage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              Icon(Icons.message),
              Text('Comunicado')
            ]
          ),
          Container(
            child: const Text(message)
          ),
          Row(
            children: <Widget>[
              const Icon(Icons.account_circle),
              Column(
                children: <Widget>[
                  const Text(messageSender),
                  Row(
                    children: const <Widget>[
                      Icon(Icons.watch_later),
                      Text('09:00'),
                      Icon(Icons.date_range),
                      Text('24 de outubro de 2020')
                    ]
                  )
                ]
              )
            ]
          )
        ]
      ),
    );
  }
}