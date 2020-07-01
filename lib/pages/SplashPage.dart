import 'package:aldeia_montessori/services/storage-service.dart';
import 'package:flutter/material.dart';
import 'package:aldeia_montessori/services/auth-service.dart';

class SplashPage extends StatelessWidget {
  final AuthService authService = AuthService();
  final StorageService storageService = StorageService();

  Future<void> checkUserIsAuthenticated(BuildContext context) async {
    final bool isAuthenticated = await authService.isAuthenticated();

    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> redirectToRightPage(BuildContext context) async {
    if (await storageService.hasSkipIntroduction()) {
      checkUserIsAuthenticated(context);
    } else {
      Navigator.pushReplacementNamed(context, '/introduction');
    }
  }
  @override
  Widget build(BuildContext context) {
    redirectToRightPage(context);
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/aldeia_splash.png'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      )
    );
  }
}