class User {
  User({this.id, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      token: json['token'] as String,
    );
  }

  final int id;
  final String token;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token,
    };
  }
}