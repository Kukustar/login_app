enum AuthenticationStatus { authenticated, unauthenticated, failed, successResetPassword }

class AuthenticationState {
  const AuthenticationState({
    this.status = AuthenticationStatus.unauthenticated,
    this.memorableWorld = ''
  });

  final AuthenticationStatus status;
  final String memorableWorld;

  AuthenticationState copyWith({ AuthenticationStatus? status, String? memorableWorld }) {
    return AuthenticationState(
      status: status ?? this.status,
      memorableWorld: memorableWorld ?? this.memorableWorld
    );
  }
}