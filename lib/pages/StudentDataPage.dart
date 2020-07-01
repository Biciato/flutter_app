import 'package:flutter/material.dart';
import 'package:aldeia_montessori/models/student.dart';
import 'package:aldeia_montessori/services/api-service.dart';

Future<Student> fetchCircular() async {
  final ApiService apiService = ApiService();
  return Student.fromJson(
      await apiService.get('/student') as Map<String, dynamic>);
}

class StudentDataPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StudentDataPageState();
}

class StudentDataPageState extends State<StudentDataPage> {
  final List<String> entries = <String>[
    'Nome do Aluno: Aluno Exemplo',
    'Nome do Parente: Parente Exemplo',
    'E-mail do Parente: parente@exemplo.com'
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(10),
            child: Card(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(child: Text(entries[index])),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              )
            )),
        Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 30),
            child: const CircleAvatar(backgroundImage: AssetImage('assets/perfil.jpg'))
        ),
    ]);
  }
}
