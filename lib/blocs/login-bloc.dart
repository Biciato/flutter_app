import 'dart:async';

import 'package:aldeia_montessori/events/auth-event.dart';
import 'package:aldeia_montessori/events/login-event.dart';
import 'package:aldeia_montessori/models/user.dart';
import 'package:aldeia_montessori/states/login-state.dart';
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
        final User user = await authService.authenticate(
          email: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(user: user));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}