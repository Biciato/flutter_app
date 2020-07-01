import 'dart:async';

import 'package:flutter/material.dart';
import '../models/circular.dart';
import '../services/api-service.dart' show ApiService;

Future<Circular> fetchCircular() async {
  final ApiService apiService = ApiService();
  return Circular.fromJson(await apiService.get('api.url') as Map<String, dynamic>);
}

class CircularPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CircularPageState();
}

class CircularPageState extends State<CircularPage> {
  Future<Circular> futureCircular;

  @override
  void initState() {
    super.initState();
    futureCircular = fetchCircular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Circular>(
          future: futureCircular,
          builder: (BuildContext context, AsyncSnapshot<Circular> snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text(snapshot.error as String);
            }

            return const CircularProgressIndicator();
          }
        ),
      )
    );
  }
}
