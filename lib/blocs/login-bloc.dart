import 'dart:async';

import 'package:flutterapp/events/auth-event.dart';
import 'package:flutterapp/events/login-event.dart';
import 'package:flutterapp/states/login-state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../services/auth-service.dart';

import 'auth-bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.authService,
    @required this.authenticationBloc,
  })  : assert(authService != null),
        assert(authenticationBloc != null);

  final AuthService authService;
  final AuthenticationBloc authenticationBloc;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final String token = await authService.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}