import 'package:aldeia_montessori/models/diary.dart';
import 'package:aldeia_montessori/services/api-service.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsDate.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsFood.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsMedication.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsMessage.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsScopeTitle.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsSleep.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsStudentName.dart';
import 'package:aldeia_montessori/widgets/DiaryDetailsToilet.dart';
import 'package:flutter/material.dart';

Future<Diary> fetchDiary() async {
  // final ApiService apiService = ApiService();
  return Diary.fromJson(<String, dynamic>{});
}

class DiaryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DiaryPageState();
}

class DiaryPageState extends State<DiaryPage> {
  Future<Diary> futureDiary;

  @override
  void initState() {
    super.initState();
    futureDiary = fetchDiary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Diary>(
        future: futureDiary,
        builder: (BuildContext context, AsyncSnapshot<Diary> snapshot) {
          /*if (snapshot.hasData) {
            return Text(snapshot.data.date.toString());
          } else if (snapshot.hasError) {
            return Text(snapshot.error as String);
          }*/

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      const DiaryDetailsStudentName('Bernardo de Campos'),
                      DiaryDetailsDate(),
                      const DiaryDetailsScopeTitle('Informações de casa'),
                      DiaryDetailsMessage(),
                      DiaryDetailsMedication(),
                      const DiaryDetailsScopeTitle('Informações da Aldeia'),
                      DiaryDetailsFood(),
                      DiaryDetailsSleep(),
                      DiaryDetailsToilet(),
                      DiaryDetailsMessage(),
                      DiaryDetailsMedication()
                    ]
                  ),
                )
              ]
            )
          );
        }
      )
    );
  }
}