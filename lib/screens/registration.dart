import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_app/services/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationState();
  }
}

class _RegistrationState extends State<Registration> {

  String login = '';
  String loginError = '';
  String password = '';
  String passwordRepeat = '';

  Future<bool> registerUser() async {
    Database db = await createDatabase();
    try {
      final List<Map <String, dynamic>> user = await db.query('USER', where: "LOGIN = ?", whereArgs: [login]);

      if (user.isNotEmpty) {
        setState(() {
          loginError = "Такой пользователь уже зарегестрирован";
        });
        return false;
      } else {
        final String md5Password = md5.convert(utf8.encode(password)).toString();
        await db.insert("USER", Map.from({ "LOGIN": login, "PASSWORD": md5Password }));
        return true;
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }

      return false;
    }
    
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация')
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children:  [
                SizedBox(height: 150),
                Text('Введите данные для регистрации'),
                SizedBox(height: 10,),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      login = value;
                      loginError = '';
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
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Поле не может быть пустым";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Пароль'),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      passwordRepeat = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Поле не может быть пустым";
                    }

                    if (value != password) {
                      return "Пароли не совпадают";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Повтор пароля'),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool res = await registerUser();
                          if (res) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        }
                      },
                      child: Text('Регистрация')
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
