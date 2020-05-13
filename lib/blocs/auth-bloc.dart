import 'dart:async';

import 'package:flutterapp/events/auth-event.dart';
import 'package:flutterapp/states/auth-state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../services/auth-service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.authService})
      : assert(authService != null);

  final AuthService authService;

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      final bool hasToken = await authService.isAuthenticated();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authService.saveToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authService.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}