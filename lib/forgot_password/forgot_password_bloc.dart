import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:login_app/authentication/authentication_repository.dart';
import 'package:login_app/forgot_password/forgot_password_event.dart';
import 'package:login_app/forgot_password/forgot_password_state.dart';
import 'package:login_app/services/transform_key_to_error.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({ required this.repository }) : super(const ForgotPasswordState()) {
    on<ForgotPasswordLoginChanged>(_onForgotPasswordLoginChanged);
    on<ForgotPasswordNewPasswordChanged>(_onForgotPasswordNewPasswordChanged);
    on<ForgotPasswordMemorableWorldChange>(_onForgotPasswordMemorableWorldChange);
    on<ClearForgotPasswordState>(_onClearState);
    on<ForgotPasswordShowPasswordChange>(_onForgotPasswordShowPasswordChange);
    on<ForgotPasswordSubmit>(_onForgotPasswordSubmit);
  }

  final AuthenticationRepository repository;

  void _onForgotPasswordLoginChanged(ForgotPasswordLoginChanged event, Emitter<ForgotPasswordState> emit) {
    final login = event.login;
    emit(state.copyWith(loginError: '', login: login));
  }

  void _onForgotPasswordNewPasswordChanged(ForgotPasswordNewPasswordChanged event, Emitter<ForgotPasswordState> emit) {
    final newPassword = event.newPassword;
    emit(state.copyWith(newPasswordError: '', newPassword: newPassword));

  }

  void _onForgotPasswordMemorableWorldChange(ForgotPasswordMemorableWorldChange event, Emitter<ForgotPasswordState> emit) {
    final memorableWorld = event.memorableWorld;
    emit(state.copyWith(memorableWorld: memorableWorld, memorableWorldError: ''));
  }

  void _onForgotPasswordShowPasswordChange(ForgotPasswordShowPasswordChange event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void _onForgotPasswordSubmit(ForgotPasswordSubmit event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(loginError: '', memorableWorldError: '', newPasswordError: ''));
    try {
      await repository.resetPassword(
          state.login,
          state.memorableWorld,
          state.newPassword
      );
    } on LoginFieldEmpty {
      emit(state.copyWith(loginError: EMPTY_FIELD));
    } on MemorableFieldEmpty  {
      emit(state.copyWith(memorableWorldError: EMPTY_FIELD));
    } on PasswordFieldEmpty {
      emit(state.copyWith(newPasswordError: EMPTY_FIELD));
    } on NoUserFound {
      emit(state.copyWith(loginError: THERE_IS_NO_SUCH_USER));
    } on WrongMemorableWorld {
      emit(state.copyWith(memorableWorldError: INCORRECT_RECOVERY_KEY));
    } catch (exception) {
      if (kDebugMode){
        print(exception);
      }
    }
  }

  void _onClearState(ClearForgotPasswordState event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
      memorableWorld: '',
      memorableWorldError: '',
      newPasswordError: '',
      newPassword: '',
      login: '',
      loginError: ''
    ));
  }
}