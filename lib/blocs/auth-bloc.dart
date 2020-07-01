import 'dart:async';

import 'package:aldeia_montessori/events/auth-event.dart';
import 'package:aldeia_montessori/services/auth-service.dart';
import 'package:aldeia_montessori/services/storage-service.dart';
import 'package:aldeia_montessori/states/auth-state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this.authService, {@required this.storageService})
      : assert(storageService != null);

  final StorageService storageService;
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
      await storageService.saveUserData(event.user);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await storageService.deleteUserData();
      yield AuthenticationUnauthenticated();
    }
  }
}