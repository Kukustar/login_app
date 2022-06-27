import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:login_app/authentication/authentication_event.dart';
import 'package:login_app/authentication/authentication_repository.dart';
import 'package:login_app/authentication/authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository repository
  }) : _authenticationRepository = repository,
        super(const AuthenticationState()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<LogAut>(_onLogout);
    on<AuthenticationMemorableWorldChanged>(_onAuthenticationMemorableWorldChanged);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
        (status) => add(AuthenticationStatusChanged(status))
    );
    _authenticationMemorableWorldSubscription = _authenticationRepository.memorableWorld.listen(
        (memorableWorld) => add(AuthenticationMemorableWorldChanged(memorableWorld))
    );
  }

  final AuthenticationRepository _authenticationRepository;

  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;
  late StreamSubscription<String> _authenticationMemorableWorldSubscription;

  void _onAuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) {
    final status = event.status;
    emit(state.copyWith(status: status));
  }

  void _onAuthenticationMemorableWorldChanged(AuthenticationMemorableWorldChanged event, Emitter<AuthenticationState> emit) {
    final memorableWorld = event.memorableWorld;
    emit(state.copyWith(memorableWorld: memorableWorld));
  }

  Future<void> _onLogout(LogAut event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(memorableWorld: ''));
    await _authenticationRepository.logOut();
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationMemorableWorldSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
}