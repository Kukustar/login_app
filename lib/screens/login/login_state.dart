class LoginState {
  const LoginState({
    this.login = '',
    this.password = '',
    this.passwordError = '',
    this.loginError = ''
  });

  final String login;
  final String password;
  final String loginError;
  final String passwordError;

  LoginState copyWith({
    String? login,
    String? password,
    String? loginError,
    String? passwordError
  }) {
    return LoginState(
      login: login ?? this.login,
      password: password ?? this.password,
      loginError: loginError ?? this.loginError,
      passwordError: passwordError ?? this.passwordError
    );
  }
}

