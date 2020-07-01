import 'package:aldeia_montessori/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:aldeia_montessori/pages/MainPage.dart';
import 'package:aldeia_montessori/services/auth-service.dart';

import 'ForgotPasswordPage.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final AuthService authService = AuthService();
    try {
      await authService.authenticate(
          email: _emailController.text, password: _passwordController.text);
    } catch (ex) {
      setState(() {
        isLoading = false;
      });
      final Utils utils = Utils();
      return utils.openDialog(context, 'Erro',
          Text(ex.message as String, textAlign: TextAlign.center), 'Fechar');
    }
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) => const MainPage(0)),
      (Route<dynamic> route) => false,
    );
  }

  void forgotPassword(BuildContext context) =>
      Navigator.push<dynamic>(
        context,
        MaterialPageRoute<dynamic>(builder: (BuildContext context) => ForgotPasswordPage()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 230,
              alignment: Alignment.topCenter,
              child: const Image(
                width: 80,
                height: 74.11,
                image: AssetImage('assets/logo-aldeia.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 328,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: 328,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
            ),
            Container(
              width: 328,
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () => forgotPassword(context),
                textColor: const Color(0xFFF58634),
                child: const Text('Esqueceu a senha?', textAlign: TextAlign.right),
              ),
            ),
            Container(
              height: 100,
              width: 328,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                minWidth: 328.0,
                height: 50,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: const Color(0xFFF58634),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white))
                      : const Text('ENTRAR'),
                  onPressed: () => login(context),
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
