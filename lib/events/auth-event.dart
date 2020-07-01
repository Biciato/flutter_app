import 'package:aldeia_montessori/models/user.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => <Object>[];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  const LoggedIn({@required this.user});

  final User user;

  @override
  List<Object> get props => <Object>[user];

  @override
  String toString() => 'LoggedIn { token: ${user.token} }';
}

class LoggedOut extends AuthenticationEvent {}
