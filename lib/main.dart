// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/screens/home/RandomWords.dart';
import 'package:flutterapp/screens/loading/LoadingPage.dart';
import 'package:flutterapp/screens/login/LoginPage.dart';
import 'package:flutterapp/states/auth-state.dart';
import './services/auth-service.dart';
import 'blocs/auth-bloc.dart';
import 'events/auth-event.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc<dynamic, dynamic> bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final AuthService authService = AuthService();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) {
        return AuthenticationBloc(authService: authService)
          ..add(AppStarted());
      },
      child: App(authService: authService),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key key, @required this.authService}) : super(key: key);

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationAuthenticated) {
            return RandomWords();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(authService: authService);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
