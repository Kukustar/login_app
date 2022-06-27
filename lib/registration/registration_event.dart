abstract class RegistrationEvent {
  const RegistrationEvent();
}

class RegistrationLoginChanged extends RegistrationEvent {
  const RegistrationLoginChanged(this._login);
  final String _login;

  String get login => _login;
}

class RegistrationPasswordChanged extends RegistrationEvent {
  const RegistrationPasswordChanged(this._password);
  final String _password;

  String get password => _password;
}

class RegistrationPasswordRepeatChanged extends RegistrationEvent {
  const RegistrationPasswordRepeatChanged(this._passwordRepeat);
  final String _passwordRepeat;

  String get passwordRepeat => _passwordRepeat;
}

class ClearRegistrationState extends RegistrationEvent {
  const ClearRegistrationState();
}

class RegistrationShowPassword extends RegistrationEvent {
  const RegistrationShowPassword();
}

class RegistrationShowPasswordRepeat extends RegistrationEvent {
  const RegistrationShowPasswordRepeat();
}


class RegistrationSubmit extends RegistrationEvent {
  const RegistrationSubmit();
}