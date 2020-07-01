import 'package:aldeia_montessori/services/api-service.dart';
import 'package:aldeia_montessori/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isLoading = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    isLoading = true;
    String title;
    String content;
    final ApiService apiService = ApiService();
    final dynamic resp = await apiService.post(
      url: '/api/reset-password',
      data: <String, String>{
        'password': _passwordController.text,
        'confirm_password': _confirmPasswordController.text
      }
    );
    if (resp.status == 200) {
      title = 'Sucesso';
      content = 'Senha renovada com sucesso!!';
    } else {
      title = 'Erro';
      content = 'Não foi possível realizar a renovação da senha!!';
    }
    isLoading = false;
    final Utils utils = Utils();
    utils.openDialog(context, title, Text(content), 'Cancelar');
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
                  child: const Text(
                    'Digite sua nova senha e confirme',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 328,
                  child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Crie uma nova senha',
                      )
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 328,
                  child: TextField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirme sua nova senha',
                      )
                  )
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(top: 100),
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
                            : const Text('CONCLUIR'),
                        onPressed: () => resetPassword(context)
                    )
                ),
              )
            ]
        )
    );
  }
}