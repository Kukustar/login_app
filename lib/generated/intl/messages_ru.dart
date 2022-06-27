// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authorization": MessageLookupByLibrary.simpleMessage("Авторизация"),
        "emptyField":
            MessageLookupByLibrary.simpleMessage("Поле не может быть пустым"),
        "english": MessageLookupByLibrary.simpleMessage("Английский"),
        "enter": MessageLookupByLibrary.simpleMessage("Вход"),
        "enterTheRegistrationDetails": MessageLookupByLibrary.simpleMessage(
            "Введите данные для регистрации"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "incorrectRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Неправильный ключ восстановления"),
        "logOrRegister": MessageLookupByLibrary.simpleMessage(
            "Добро пожаловать в приложение, войдите или зарегистрируйтесь"),
        "login": MessageLookupByLibrary.simpleMessage("Логин"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordHasBeenSuccessfullyRestored":
            MessageLookupByLibrary.simpleMessage(
                "Пароль успешно восстановлен!"),
        "passwordsNotMatch":
            MessageLookupByLibrary.simpleMessage("Пароли не совпадают"),
        "recover": MessageLookupByLibrary.simpleMessage("Восстановить"),
        "recovery": MessageLookupByLibrary.simpleMessage("Восстановление"),
        "recoveryKey":
            MessageLookupByLibrary.simpleMessage("Ключ для восстановления"),
        "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "repeatPassword": MessageLookupByLibrary.simpleMessage("Повтор пароля"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "saveKeyForPasswordRecovery": MessageLookupByLibrary.simpleMessage(
            "Save this key for password recovery"),
        "successfulAuthorization":
            MessageLookupByLibrary.simpleMessage("Successful authorization"),
        "thereIsNoSuchUser": MessageLookupByLibrary.simpleMessage(
            "Такого пользователя не существует"),
        "userExist": MessageLookupByLibrary.simpleMessage(
            "Пользователь с таким логином уже существует"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage("Неверный пароль")
      };
}
