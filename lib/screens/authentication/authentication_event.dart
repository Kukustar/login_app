import 'package:login_app/screens/authentication/authentication_state.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this._status);
  final AuthenticationStatus _status;

  AuthenticationStatus get status => _status;
}