enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationState {
  const AuthenticationState({ this.status = AuthenticationStatus.unauthenticated });

  final AuthenticationStatus status;

  AuthenticationState copyWith({ AuthenticationStatus? status }) {
    return AuthenticationState(status: status ?? this.status);
  }
}