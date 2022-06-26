import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:login_app/screens/authentication/authentication_event.dart';
import 'package:login_app/screens/authentication/authentication_repository.dart';
import 'package:login_app/screens/authentication/authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc( {
    required AuthenticationRepository repository
  }) : _authenticationRepository = repository,
        super(const AuthenticationState()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
        (status) => add(AuthenticationStatusChanged(status))
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  void _onAuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) {
    final status = event.status;
    emit(state.copyWith(status: status));
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
}