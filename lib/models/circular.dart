/// Circular Representation including Json Format.
class Circular {
  Circular({this.title, this.number, this.text, this.date});

  factory Circular.fromJson(Map<String, dynamic> json) {
    return Circular(
      title: json['title'] as String,
      number: json['number'] as String,
      text: json['text'] as String,
      date: json['date'] as DateTime
    );
  }

  final String title;
  final String number;
  final String text;
  final DateTime date;
}