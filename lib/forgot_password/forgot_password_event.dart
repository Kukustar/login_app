abstract class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class ForgotPasswordLoginChanged extends ForgotPasswordEvent {
  const ForgotPasswordLoginChanged(this._login);
  final String _login;

  String get login => _login;
}

class ForgotPasswordNewPasswordChanged extends ForgotPasswordEvent {
  const ForgotPasswordNewPasswordChanged(this._newPassword);
  final String _newPassword;

  String get newPassword => _newPassword;
}

class ForgotPasswordMemorableWorldChange extends ForgotPasswordEvent {
  const  ForgotPasswordMemorableWorldChange(this._memorableWorld);
  final String _memorableWorld;

  String get memorableWorld => _memorableWorld;
}

class ForgotPasswordSubmit extends ForgotPasswordEvent {
  const ForgotPasswordSubmit();
}
