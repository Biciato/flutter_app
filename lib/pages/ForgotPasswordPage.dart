import 'package:aldeia_montessori/pages/SendCodePage.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  void redirectTo(String type) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => SendCodePage(type),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFF58634), iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: const Text(
                'Recuperar por:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  height: 156,
                  minWidth: 156,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: const Color(0xFFF58634),
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                          size: 70.0,
                          semanticLabel: 'Link para enviar código por e-mail',
                        ),
                        Text('E-mail', textScaleFactor: 1.5),
                      ]),
                    onPressed: () => redirectTo('E-mail'),
                  )
                ),
                ButtonTheme(
                  height: 156,
                  minWidth: 156,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: const Color(0xFFF58634),
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 70.0,
                          semanticLabel: 'Link para enviar código por SMS',
                        ),
                        Text('SMS', textScaleFactor: 1.5),
                      ]
                    ),
                    onPressed: () => redirectTo('Telefone'),
                  )
                ),
              ]
            )
          ]
        ),
      ),
    );
  }
}

