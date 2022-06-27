import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:login_app/authentication/authentication_repository.dart';
import 'package:login_app/login/login_event.dart';
import 'package:login_app/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({ required this.repository }) : super(const LoginState()) {
    on<LoginLoginChanged>(_onLoginChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_onLoginSubmit);
    on<ClearLoginState>(_onClearState);
    on<LoginShowPassword>(_onLoginShowPassword);
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

  void _onClearState(ClearLoginState event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        loginError: '',
        login: '',
        passwordError: '',
        password: '')
    );
  }

  void _onLoginShowPassword(LoginShowPassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    try {
      await repository.logIn(state.login, state.password);
    } on LoginFieldEmpty {
      emit(state.copyWith(loginError: "Поле не может быть пустым"));
    } on PasswordFieldEmpty {
      emit(state.copyWith(passwordError: "Поле не может быть пустым"));
    } on NoUserFound {
      emit(state.copyWith(loginError: "Такого пользователя не существует"));
    } on WrongPassword {
      emit(state.copyWith(passwordError: "Неверный пароль"));
    } catch (exception) {
      if (kDebugMode) {
        print('Error in _onLoginSubmit $exception');
      }
    }
  }
}