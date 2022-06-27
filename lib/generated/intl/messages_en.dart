// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authorization": MessageLookupByLibrary.simpleMessage("Authorization"),
        "emptyField":
            MessageLookupByLibrary.simpleMessage("Field can not be empty"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "enterTheRegistrationDetails": MessageLookupByLibrary.simpleMessage(
            "Enter the registration details"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "incorrectRecoveryKey":
            MessageLookupByLibrary.simpleMessage("Incorrect Recovery key"),
        "logOrRegister": MessageLookupByLibrary.simpleMessage(
            "Welcome to the app, log in or register"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordHasBeenSuccessfullyRestored":
            MessageLookupByLibrary.simpleMessage(
                "Password has been successfully restored!"),
        "passwordsNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords don\'t match"),
        "recover": MessageLookupByLibrary.simpleMessage("Recover"),
        "recovery": MessageLookupByLibrary.simpleMessage("Recovery"),
        "recoveryKey": MessageLookupByLibrary.simpleMessage("Recovery key"),
        "registration": MessageLookupByLibrary.simpleMessage("Registration"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repeat password"),
        "russian": MessageLookupByLibrary.simpleMessage("Russian"),
        "saveKeyForPasswordRecovery": MessageLookupByLibrary.simpleMessage(
            "Сохраните этот ключ для восстановления пароля"),
        "successfulAuthorization":
            MessageLookupByLibrary.simpleMessage("Успешная авторизация"),
        "thereIsNoSuchUser":
            MessageLookupByLibrary.simpleMessage("There is no such user"),
        "userExist": MessageLookupByLibrary.simpleMessage(
            "A user with this username already exists"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage("Wrong password")
      };
}
