// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Авторизация`
  String get authorization {
    return Intl.message(
      'Авторизация',
      name: 'authorization',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get russian {
    return Intl.message(
      'Русский',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Английский`
  String get english {
    return Intl.message(
      'Английский',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Вход`
  String get enter {
    return Intl.message(
      'Вход',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get registration {
    return Intl.message(
      'Регистрация',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Добро пожаловать в приложение, войдите или зарегистрируйтесь`
  String get logOrRegister {
    return Intl.message(
      'Добро пожаловать в приложение, войдите или зарегистрируйтесь',
      name: 'logOrRegister',
      desc: '',
      args: [],
    );
  }

  /// `Пароль успешно восстановлен!`
  String get passwordHasBeenSuccessfullyRestored {
    return Intl.message(
      'Пароль успешно восстановлен!',
      name: 'passwordHasBeenSuccessfullyRestored',
      desc: '',
      args: [],
    );
  }

  /// `Логин`
  String get login {
    return Intl.message(
      'Логин',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Забыли пароль?`
  String get forgotPassword {
    return Intl.message(
      'Забыли пароль?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Поле не может быть пустым`
  String get emptyField {
    return Intl.message(
      'Поле не может быть пустым',
      name: 'emptyField',
      desc: '',
      args: [],
    );
  }

  /// `Такого пользователя не существует`
  String get thereIsNoSuchUser {
    return Intl.message(
      'Такого пользователя не существует',
      name: 'thereIsNoSuchUser',
      desc: '',
      args: [],
    );
  }

  /// `Неверный пароль`
  String get wrongPassword {
    return Intl.message(
      'Неверный пароль',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Неправильный ключ восстановления`
  String get incorrectRecoveryKey {
    return Intl.message(
      'Неправильный ключ восстановления',
      name: 'incorrectRecoveryKey',
      desc: '',
      args: [],
    );
  }

  /// `Пользователь с таким логином уже существует`
  String get userExist {
    return Intl.message(
      'Пользователь с таким логином уже существует',
      name: 'userExist',
      desc: '',
      args: [],
    );
  }

  /// `Пароли не совпадают`
  String get passwordsNotMatch {
    return Intl.message(
      'Пароли не совпадают',
      name: 'passwordsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Восстановление`
  String get recovery {
    return Intl.message(
      'Восстановление',
      name: 'recovery',
      desc: '',
      args: [],
    );
  }

  /// `Введите данные для регистрации`
  String get enterTheRegistrationDetails {
    return Intl.message(
      'Введите данные для регистрации',
      name: 'enterTheRegistrationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Повтор пароля`
  String get repeatPassword {
    return Intl.message(
      'Повтор пароля',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Ключ для восстановления`
  String get recoveryKey {
    return Intl.message(
      'Ключ для восстановления',
      name: 'recoveryKey',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get newPassword {
    return Intl.message(
      'Новый пароль',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Восстановить`
  String get recover {
    return Intl.message(
      'Восстановить',
      name: 'recover',
      desc: '',
      args: [],
    );
  }

  /// `Успешная авторизация`
  String get successfulAuthorization {
    return Intl.message(
      'Успешная авторизация',
      name: 'successfulAuthorization',
      desc: '',
      args: [],
    );
  }

  /// `Сохраните этот ключ для восстановления пароля`
  String get saveKeyForPasswordRecovery {
    return Intl.message(
      'Сохраните этот ключ для восстановления пароля',
      name: 'saveKeyForPasswordRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
