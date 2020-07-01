import 'package:aldeia_montessori/services/api-service.dart';
import 'package:aldeia_montessori/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ResetPasswordPage.dart';

class InputCodePage extends StatefulWidget {
  const InputCodePage(this._type);

  final String _type;

  @override
  InputCodePageState createState() => InputCodePageState(_type);
}

class InputCodePageState extends State<InputCodePage> {
  InputCodePageState(this._type);

  final String _type;
  bool isLoading = false;

  final TextEditingController _inputController = TextEditingController();

  Future<void> checkCode() async {
    isLoading = true;
    final ApiService apiService = ApiService();
    final dynamic resp = await apiService.post(
      url: '/api/check-code',
      data: <String, String>{ 'code': _inputController.text }
    );
    if (resp.status == 200) {
      Navigator.push<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => ResetPasswordPage(),
        ),
      );
    } else {
      isLoading = false;
      final Utils utils = Utils();
      utils.openDialog(
          context,
          'Erro',
          const Text('Não foi possível verificar o código', textAlign: TextAlign.center),
          'Fechar'
      );
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
                    'Insira abaixo o código que enviamos no seu $_type',
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
                        onPressed: () => checkCode()
                    )
                ),
              )
            ]
        )
    );
  }
}