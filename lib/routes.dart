import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home/RandomWords.dart';
import 'package:flutterapp/screens/loading/LoadingPage.dart';
import 'package:flutterapp/screens/login/LoginPage.dart';
import 'package:flutterapp/services/auth-service.dart';

final AuthService authService = AuthService();

final Map<String, Widget Function(BuildContext context)> routes = <String, Widget Function(BuildContext context)>{
  '/login': (BuildContext context) => LoginPage(authService: authService,),
  '/home': (BuildContext context) => RandomWords(),
  '/loading' : (BuildContext context) => LoadingIndicator(),
};
