class ForgotPasswordState {
  const ForgotPasswordState({
    this.login = '',
    this.newPassword = '',
    this.memorableWorld = '',
    this.newPasswordError = '',
    this.loginError = '',
    this.memorableWorldError = '',
  });

  final String login;
  final String newPassword;
  final String memorableWorld;

  final String loginError;
  final String newPasswordError;
  final String memorableWorldError;

  ForgotPasswordState copyWith({
    String? login,
    String? newPassword,
    String? loginError,
    String? newPasswordError,
    String? memorableWorld,
    String? memorableWorldError,
  }) {
    return ForgotPasswordState(
        login: login ?? this.login,
        newPassword: newPassword ?? this.newPassword,
        memorableWorld: memorableWorld ?? this.memorableWorld,
        loginError: loginError ?? this.loginError,
        newPasswordError: newPasswordError ?? this.newPasswordError,
        memorableWorldError: memorableWorldError ?? this.memorableWorldError,

    );
  }
}

