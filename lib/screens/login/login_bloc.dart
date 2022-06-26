import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:login_app/screens/authentication/authentication_repository.dart';
import 'package:login_app/screens/login/login_event.dart';
import 'package:login_app/screens/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({ required this.repository }) : super(const LoginState()) {
    on<LoginLoginChanged>(_onLoginChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_onLoginSubmit);
  }

  final AuthenticationRepository repository;

  void _onLoginChanged(LoginLoginChanged event, Emitter<LoginState> emit) {
    final login = event.login;
    emit(state.copyWith(login: login, loginError: ''));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    emit(state.copyWith(password: password, passwordError: ''));
  }

  void _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    try {
      await repository.logIn(state.login, state.password);
    } on NoUserFoundException catch (_) {
      emit(state.copyWith(loginError: "Такого пользователя не существует"));
    } on WrongPasswordException catch (_) {
      emit(state.copyWith(passwordError: "Неверный пароль"));
    } catch (exception) {
      if (kDebugMode) {
        print('Error in _onLoginSubmit $exception');
      }
    }
  }
}