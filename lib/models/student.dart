/// Student Representation including Json Format.
class Student {
  Student({this.name, this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['id'] as String,
      age: json['token'] as String,
    );
  }

  final String name;
  final String age;
}