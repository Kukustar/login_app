import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:login_app/authentication/authentication_repository.dart';
import 'package:login_app/registration/registration_event.dart';
import 'package:login_app/registration/registration_state.dart';



class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({ required this.repository }) : super(const RegistrationState()) {
    on<RegistrationLoginChanged>(_onRegistrationLoginChanged);
    on<RegistrationPasswordChanged>(_onRegistrationPasswordChanged);
    on<RegistrationPasswordRepeatChanged>(_onRegistrationPasswordRepeatChanged);
    on<ClearRegistrationState>(_onClearRegistrationState);
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

  void _onRegistrationSubmit(RegistrationSubmit event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(loginError: '', passwordError: '', passwordRepeatError: ''));
    try {
      await repository.registration(state.login, state.password, state.passwordRepeat);
    } on LoginFieldEmpty  {
      emit(state.copyWith(loginError: 'Поле не может быть пустым'));
    } on PasswordFieldEmpty {
      emit(state.copyWith(passwordError: 'Поле не может быть пустым'));
    }  on PasswordNotEqual {
      emit(state.copyWith(passwordRepeatError: 'Пароли не совпадают'));
    }  on UserAlreadyExist {
      emit(state.copyWith(loginError: 'Пользователь с таким логином уже существует'));
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
      passwordRepeatError: ''
    ));
  }
}