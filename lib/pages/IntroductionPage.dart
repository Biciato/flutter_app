import 'package:aldeia_montessori/services/auth-service.dart';
import 'package:aldeia_montessori/widgets/IntroductionCarousel.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  final AuthService authService = AuthService();

  Future<void> redirectToLoginOrHome(BuildContext context) async {
    final String routeName = await authService.isAuthenticated() ? '/home' : '/login';
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: IntroductionCarousel()
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: MediaQuery.of(context).size.width * 1,
              child: ButtonTheme(
                minWidth: 328.0,
                height: 50,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: const Color(0xFFF58634),
                  child: const Text('CONTINUAR'),
                  onPressed: () => redirectToLoginOrHome(context),
                ),
              )
            )
          ]
        )
      )
    );
  }
}