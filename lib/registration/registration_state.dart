class RegistrationState {
  const RegistrationState({
    this.login = '',
    this.password = '',
    this.passwordRepeat = '',
    this.loginError = '',
    this.passwordError = '',
    this.passwordRepeatError = '',
    this.showPassword = false,
    this.showPasswordRepeat = false,
});

  final String login;
  final String password;
  final String passwordRepeat;

  final String loginError;
  final String passwordError;
  final String passwordRepeatError;

  final bool showPassword;
  final bool showPasswordRepeat;

  RegistrationState copyWith({
    String? login,
    String? password,
    String? passwordRepeat,
    String? loginError,
    String? passwordError,
    String? passwordRepeatError,
    bool? showPassword,
    bool? showPasswordRepeat,
  }) {
    return RegistrationState(
      login: login ?? this.login,
      password: password ?? this.password,
      passwordRepeat: passwordRepeat ?? this.passwordRepeat,
      loginError: loginError ?? this.loginError,
      passwordError: passwordError ?? this.passwordError,
      passwordRepeatError: passwordRepeatError ?? this.passwordRepeatError,
      showPassword: showPassword ?? this.showPassword,
      showPasswordRepeat: showPasswordRepeat ?? this.showPasswordRepeat,
    );
  }
}