import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterapp/models/user.dart';

class UserService {
  Future<User> saveUser(User user) async {
    final http.Response response = await http.post(
      'http:///',
      body: jsonEncode(<String, String>{
        'name': 'name'
      })
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body) as Map<String, String>);
    } else {
      throw Exception('Failed to save user.');
    }
  }
}