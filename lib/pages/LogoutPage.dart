import 'dart:async';
import 'package:aldeia_montessori/pages/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:aldeia_montessori/services/auth-service.dart';

class LogoutPage extends StatelessWidget {

  final AuthService authService = AuthService();

  Future<void> logout(BuildContext context) async {
    await authService.logout();
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) => SplashPage()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 1), () => logout(context));
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text('Saindo...'),
            CircularProgressIndicator()
          ]
        ));
  }
}
