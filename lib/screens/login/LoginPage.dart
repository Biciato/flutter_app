import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterapp/blocs/auth-bloc.dart';
import 'package:flutterapp/blocs/login-bloc.dart';
import 'package:flutterapp/services/auth-service.dart';

import 'LoginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key, @required this.authService})
      : assert(authService != null),
        super(key: key);

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            authService: authService,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}