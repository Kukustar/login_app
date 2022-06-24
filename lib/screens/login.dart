import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';

import 'package:login_app/screens/success_login.dart';
import 'package:login_app/services/sqlite.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  String loginError = '';
  String passwordError = '';
  String login = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    Database db = await createDatabase();
    try {
      final List<Map<String, dynamic>> users = await db.query('USER', where: "LOGIN = ?", whereArgs: [login]);
      if (users.isEmpty) {
        setState(() {
          loginError = "Такого пользователя не существует";
        });
      } else if (users.length > 1) {
        throw Exception('More then one user');
      } else {
        Map<String, dynamic> user = users.first;
        final String md5Password = md5.convert(utf8.encode(password)).toString();
        if (md5Password == user['PASSWORD']) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SuccessLogin()
            )
          );
        } else {
          setState(() {
            passwordError = "Неверный пароль";
          });
        }

      }

    } catch (exception) {
      if (kDebugMode) {
        print("Error in loginUser $exception");
      }
      if (exception == 'More then one user') {
        print("Внутреняя ошибка приложения");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children:  [
                SizedBox(height: 150),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      loginError = '';
                      login = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Поле не может быть пустым";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Логин'),
                    errorText: loginError == '' ? null : loginError
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  onChanged: (value) {
                    passwordError = '';
                    password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Поле не может быть пустым";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Пароль'),
                    errorText: passwordError == '' ? null : passwordError
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await loginUser(context);
                        }
                      },
                      child: Text('Вход')
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}