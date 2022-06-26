import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'package:login_app/authentication/authentication_state.dart';
import 'package:login_app/services/random_memorible.dart';
import 'package:login_app/services/sqlite.dart';

class NoUserFound {}
class WrongPassword {}
class PasswordNotEqual {}
class PasswordFieldEmpty {}
class LoginFieldEmpty {}
class MemorableFieldEmpty {}
class WrongMemorableWorld {}
class UserAlreadyExist {}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final _memorableWorldController = StreamController<String>();

  Stream<AuthenticationStatus> get status async* {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('USER');
    if (user != null) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Stream<String> get memorableWorld async* {
    yield* _memorableWorldController.stream;
  }

  Future<void> logIn(String login, String password) async {
    if (login.isEmpty) {
      throw LoginFieldEmpty();
    }

    if (password.isEmpty) {
      throw PasswordFieldEmpty();
    }

    Database db = await createOrGetDatabase();
    final List<Map<String, dynamic>> users = await db.query(
        'USER',
        where: "LOGIN = ?",
        whereArgs: [login]
    );
    if (users.isEmpty) {
      _controller.add(AuthenticationStatus.failed);
      throw NoUserFound();
    }
    if (users.length > 1) {
      _controller.add(AuthenticationStatus.failed);
      throw Exception('Data in bd not valid');
    }

    Map<String, dynamic> user = users.first;
    final String md5Password = md5.convert(utf8.encode(password)).toString();
    if (md5Password == user['PASSWORD']) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('USER', user['LOGIN']);
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.failed);
      throw WrongPassword();
    }
  }

  Future<void> registration(String login, String password, String passwordRepeat) async {
    if (login.isEmpty) {
      _controller.add(AuthenticationStatus.failed);
      throw LoginFieldEmpty();
    }

    if (password.isEmpty) {
      _controller.add(AuthenticationStatus.failed);
      throw PasswordFieldEmpty();
    }

    if (password != passwordRepeat) {
      _controller.add(AuthenticationStatus.failed);
      throw PasswordNotEqual();
    }
    Database db = await createOrGetDatabase();
    final List<Map <String, dynamic>> user = await db.query(
        'USER',
        where: "LOGIN = ?",
        whereArgs: [login]
    );
    if (user.isNotEmpty) {
      _controller.add(AuthenticationStatus.failed);
      throw UserAlreadyExist();
    }
    final String md5Password = md5.convert(utf8.encode(password)).toString();
    final String memorableWord = getRandomString();
    await db.insert("USER", Map.from({
      "LOGIN": login,
      "PASSWORD": md5Password,
      "MEMORABLE_WORD": memorableWord
    }));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('USER', login);
    _controller.add(AuthenticationStatus.authenticated);
    _memorableWorldController.add(memorableWord);
  }

  Future<void> resetPassword(String login, String memorableWorld, String newPassword) async {
    if (login.isEmpty) {
      throw LoginFieldEmpty();
    }
    if (memorableWorld.isEmpty) {
      throw MemorableFieldEmpty();
    }
    if (newPassword.isEmpty) {
      throw PasswordFieldEmpty();
    }
    Database db = await createOrGetDatabase();
    final List<Map<String, dynamic>> users = await db.query('USER', where: "LOGIN = ?", whereArgs: [login]);
    if (users.isEmpty) {
      _controller.add(AuthenticationStatus.failed);
      throw NoUserFound();
    }
    if (users.length > 1) {
      _controller.add(AuthenticationStatus.failed);
      throw Exception('Data in bd not valid');
    }
    Map<String, dynamic> user = users.first;
    if (user['MEMORABLE_WORD'] == memorableWorld) {
      final String md5NewPassword = md5.convert(utf8.encode(newPassword)).toString();
      await db.update(
        "USER",
        Map.from({ "PASSWORD": md5NewPassword }),
        where: "LOGIN = ?",
        whereArgs: [login],
      );
      _controller.add(AuthenticationStatus.successResetPassword);
    } else {
      _controller.add(AuthenticationStatus.failed);
      throw WrongMemorableWorld();
    }
  }

  Future<void> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('USER');
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
    _memorableWorldController.close();
  }
}