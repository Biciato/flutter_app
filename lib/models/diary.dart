/// Diary Representation including Json Format.
class Diary {
  Diary({this.date, this.description});

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
      date: json['date'] as DateTime,
      description: json['description'] as String,
    );
  }

  final DateTime date;
  final String description;
}