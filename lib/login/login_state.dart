class LoginState {
  const LoginState({
    this.login = '',
    this.password = '',
    this.passwordError = '',
    this.loginError = '',
    this.showPassword = false
  });

  final String login;
  final String password;
  final String loginError;
  final String passwordError;
  final bool showPassword;

  LoginState copyWith({
    String? login,
    String? password,
    String? loginError,
    String? passwordError,
    bool? showPassword
  }) {
    return LoginState(
        login: login ?? this.login,
        password: password ?? this.password,
        loginError: loginError ?? this.loginError,
        passwordError: passwordError ?? this.passwordError,
        showPassword: showPassword ?? this.showPassword
    );
  }
}

