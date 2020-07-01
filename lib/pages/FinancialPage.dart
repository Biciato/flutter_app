import 'package:aldeia_montessori/models/billet.dart';
import 'package:aldeia_montessori/services/api-service.dart';
import 'package:flutter/material.dart';

Future<Billet> fetchBillets() async {
  final ApiService apiService = ApiService();
  return Billet.fromJson(await apiService.get('api.url') as Map<String, dynamic>);
}

class FinancialPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FinancialPageState();

}

class FinancialPageState extends State<FinancialPage> {
  Future<Billet> futureBillet;

  @override
  void initState() {
    super.initState();
    futureBillet = fetchBillets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder<Billet>(
              future: futureBillet,
              builder: (BuildContext context, AsyncSnapshot<Billet> snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.number);
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
