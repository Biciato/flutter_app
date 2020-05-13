import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    final http.Response response = await http.post(
      'http://a23b60d0.ngrok.io/api-token-auth/',
      headers: <String, String>{HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      })
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'] as String;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to authenticate');
    }
  }

  Future<void> saveToken(String token) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(key: 'auth_token', value: token);
  }

  Future<void> deleteToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: 'auth_token');
  }

  Future<bool> isAuthenticated() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final String token = await storage.read(key: 'auth_token');
    return token != null;
  }
}