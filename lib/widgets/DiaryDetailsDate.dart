import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aldeia_montessori/resources/date-names.dart' as date_names;

class DiaryDetailsDate extends StatefulWidget {
  @override
  DiaryDetailsDateState createState() => DiaryDetailsDateState();
}

class DiaryDetailsDateState extends State<DiaryDetailsDate> {
  List<Widget> dates() {
    final List<Widget> dates = List<Widget>.generate(40, (int n) {
      DateTime date;
      if (n < 20) {
        date = DateTime.now().subtract(Duration(days: 20 - n));
        if (<int>[6, 7].contains(date.weekday)) {
          return null;
        }
      } else {
        date = DateTime.now().add(Duration(days: n - 20));
        if (<int>[6, 7].contains(date.weekday)) {
          return null;
        }
      }
      return Card(
        color: n == 20 ? const Color(0xFFF58634) : Colors.white,
        child: Container(
          width: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                child: Text(date_names.weekNames[date.weekday], style: const TextStyle(fontSize: 12))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Text(date.day.toString(), style: const TextStyle(fontSize: 24))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Text(date_names.monthNames[date.month], style: const TextStyle(fontSize: 14))
              )
            ]
          )
        )
      );
    });
    dates.removeWhere((Widget element) => element == null);

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.2,
          height: 76,
          enableInfiniteScroll: false,
          initialPage: 14
        ),
        items: dates(),
      )
    );
  }
}
