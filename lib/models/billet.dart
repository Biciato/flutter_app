/// Billet Representation including Json Format.
class Billet {
  Billet({this.number, this.value, this.isPaid, this.date});

  factory Billet.fromJson(Map<String, dynamic> json) {
    return Billet(
        number: json['number'] as String,
        value: json['value'] as String,
        isPaid: json['isPaid'] as bool,
        date: json['date'] as DateTime
    );
  }

  final String number;
  final DateTime date;
  final bool isPaid;
  final String value;
}