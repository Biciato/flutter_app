import 'package:aldeia_montessori/pages/IntroductionPage.dart';
import 'package:aldeia_montessori/pages/SplashPage.dart';
import 'package:flutter/material.dart';

import 'pages/ForgotPasswordPage.dart';
import 'pages/LoginPage.dart';
import 'pages/MainPage.dart';
import 'services/auth-service.dart';

final AuthService authService = AuthService();

final Map<String, Widget Function(BuildContext context)> routes = <String, Widget Function(BuildContext context)>{
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => const MainPage(0),
  '/forgot-password': (BuildContext context) => ForgotPasswordPage(),
  '/splash': (BuildContext context) => SplashPage(),
  '/introduction': (BuildContext context) => IntroductionPage()
};

