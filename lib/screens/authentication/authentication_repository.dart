import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:login_app/screens/authentication/authentication_state.dart';
import 'package:login_app/services/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class NoUserFoundException {}
class WrongPasswordException {}
class PasswordNotEqual {}
class PasswordFieldEmpty {}
class LoginFieldEmpty {}
class UserAlreadyExist {}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn(login, password) async  {
    Database db = await createOrGetDatabase();

      final List<Map<String, dynamic>> users = await db.query('USER', where: "LOGIN = ?", whereArgs: [login]);
      if (users.isEmpty) {
        _controller.add(AuthenticationStatus.failed);
        throw NoUserFoundException();
        
      }
      if (users.length > 1) {
        throw Exception('Data in bd not valid');
      }

      Map<String, dynamic> user = users.first;
      final String md5Password = md5.convert(utf8.encode(password)).toString();
      if (md5Password == user['PASSWORD']) {
        _controller.add(AuthenticationStatus.authenticated);
      } else {
        throw WrongPasswordException();
      }
  }

  Future<void> registration(String login, String password, String passwordRepeat) async {
    if (login.isEmpty) {
      throw LoginFieldEmpty();
    }

    if (password.isEmpty) {
      throw PasswordFieldEmpty();
    }

    if (password != passwordRepeat) {
      throw PasswordNotEqual();
    }

    Database db = await createOrGetDatabase();
    final List<Map <String, dynamic>> user = await db.query('USER', where: "LOGIN = ?", whereArgs: [login]);
    if (user.isNotEmpty) {
      throw UserAlreadyExist();
    }
    final String md5Password = md5.convert(utf8.encode(password)).toString();
    await db.insert("USER", Map.from({ "LOGIN": login, "PASSWORD": md5Password }));
    _controller.add(AuthenticationStatus.authenticated);
  }

  void dispose() {
    _controller.close();
  }
}