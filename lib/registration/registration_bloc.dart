import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:login_app/authentication/authentication_repository.dart';
import 'package:login_app/registration/registration_event.dart';
import 'package:login_app/registration/registration_state.dart';
import 'package:login_app/services/transform_key_to_error.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({ required this.repository }) : super(const RegistrationState()) {
    on<RegistrationLoginChanged>(_onRegistrationLoginChanged);
    on<RegistrationPasswordChanged>(_onRegistrationPasswordChanged);
    on<RegistrationPasswordRepeatChanged>(_onRegistrationPasswordRepeatChanged);
    on<ClearRegistrationState>(_onClearRegistrationState);
    on<RegistrationShowPassword>(_onRegistrationShowPassword);
    on<RegistrationShowPasswordRepeat>(_onRegistrationShowPasswordRepeat);
    on<RegistrationSubmit>(_onRegistrationSubmit);
  }

  final AuthenticationRepository repository;

  void _onRegistrationLoginChanged(RegistrationLoginChanged event, Emitter<RegistrationState> emit) {
    final login = event.login;
    emit(state.copyWith(loginError: '', login: login));
  }

  void _onRegistrationPasswordChanged(RegistrationPasswordChanged event, Emitter<RegistrationState> emit) {
    final password = event.password;
    emit(state.copyWith(passwordError: '', password: password));
  }

  void _onRegistrationPasswordRepeatChanged(RegistrationPasswordRepeatChanged event, Emitter<RegistrationState> emit) {
    final passwordRepeat = event.passwordRepeat;
    emit(state.copyWith(passwordRepeatError: '', passwordRepeat: passwordRepeat));
  }

  void _onRegistrationShowPassword(RegistrationShowPassword event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void _onRegistrationShowPasswordRepeat(RegistrationShowPasswordRepeat event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(showPasswordRepeat: !state.showPasswordRepeat));
  }

  void _onRegistrationSubmit(RegistrationSubmit event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(loginError: '', passwordError: '', passwordRepeatError: ''));
    try {
      await repository.registration(state.login, state.password, state.passwordRepeat);
    } on LoginFieldEmpty  {
      emit(state.copyWith(loginError: EMPTY_FIELD));
    } on PasswordFieldEmpty {
      emit(state.copyWith(passwordError: EMPTY_FIELD));
    }  on PasswordNotEqual {
      emit(state.copyWith(passwordRepeatError: PASSWORDS_NOT_MATCH));
    }  on UserAlreadyExist {
      emit(state.copyWith(loginError: USER_EXIST));
    } catch (exception) {
      if (kDebugMode) {
        print('Error in _onRegistrationSubmit $exception');
      }
    }
  }

  void _onClearRegistrationState(ClearRegistrationState event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      loginError: '',
      login: '',
      password: '',
      passwordError: '',
      passwordRepeat: '',
      passwordRepeatError: '',
      showPassword: false,
      showPasswordRepeat: false
    ));
  }
}