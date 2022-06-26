abstract class LoginEvent {
  const LoginEvent();
}

class LoginLoginChanged extends LoginEvent {
  const LoginLoginChanged(this._login);
  final String _login;

  String get login => _login;
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this._password);
  final String _password;

  String get password => _password;
}

class ClearState extends LoginEvent {
  const ClearState();
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}
