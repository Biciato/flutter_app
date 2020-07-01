import 'package:aldeia_montessori/services/api-service.dart';
import 'package:aldeia_montessori/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'InputCodePage.dart';

void _showDialog(
    BuildContext context, String title, Widget content, String btn) =>
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user.png must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text(title,
                  style: const TextStyle(
                    color: Colors.red,
                  ))),
          content: Row(
            children: <Widget>[
              Expanded(
                child: content,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text(btn), onPressed: () => Navigator.of(context).pop()),
          ],
        );
      },
    );

class SendCodePage extends StatefulWidget {
  const SendCodePage(this._type);

  final String _type;

  @override
  SendCodePageState createState() => SendCodePageState(_type);
}

class SendCodePageState extends State<SendCodePage> {
  SendCodePageState(this._type);

  final String _type;
  bool isLoading = false;

  final TextEditingController _inputController = TextEditingController();



  Future<void> sendCode() async {
    isLoading = true;
    final ApiService apiService = ApiService();
    final dynamic resp = await apiService.post(
      url: '/api/send-code',
      data: <String, String>{ 'email': _inputController.text }
    );
    if (resp.status == 200) {
      Navigator.push<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => InputCodePage(_type),
        ),
      );
    } else {
      isLoading = false;
      final Utils utils = Utils();
      utils.openDialog(context, 'Erro',
          const Text('Não foi possível enviar o E-mail', textAlign: TextAlign.center), 'Fechar');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFF58634), iconTheme: const IconThemeData(color: Colors.white)),
      body: Column(
        children: <Widget>[
          Container(
            width: 328,
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Digite seu $_type para recuperar a senha',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 328,
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: _type,
              )
            )
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: const EdgeInsets.only(top: 200),
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
                    : const Text('CONTINUAR'),
                onPressed: () => sendCode()
              )
            ),
          )
        ]
      )
    );
  }
}