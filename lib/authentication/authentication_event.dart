import 'package:login_app/authentication/authentication_state.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this._status);
  final AuthenticationStatus _status;

  AuthenticationStatus get status => _status;
}

class AuthenticationMemorableWorldChanged extends AuthenticationEvent {
  const  AuthenticationMemorableWorldChanged(this._memorableWorld);
  final String _memorableWorld;

  String get memorableWorld => _memorableWorld;
}

class LogAut extends AuthenticationEvent {
  const LogAut();
}