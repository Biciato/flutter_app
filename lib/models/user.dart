/// User Representation including Json Format.


class User {
  User({this.id, this.token, this.role, this.name, this.imagePath});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      token: json['token'] as String,
      role: json['role'] as String,
      name: json['name'] as String,
      imagePath: json['image_path'] as String
    );
  }

  final String id;
  final String token;
  final String role;
  final String name;
  final String imagePath;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'role': role,
      'name': name,
      'imagePath': imagePath
    };
  }
}