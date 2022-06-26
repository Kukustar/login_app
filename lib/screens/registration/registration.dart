import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/screens/authentication/authentication_repository.dart';
import 'package:login_app/screens/registration/registration_bloc.dart';
import 'package:login_app/screens/registration/registration_event.dart';
import 'package:login_app/screens/registration/registration_state.dart';
import 'package:login_app/services/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationState();
  }
}

class _RegistrationState extends State<Registration> {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) {
        return RegistrationBloc(repository: RepositoryProvider.of<AuthenticationRepository>(context));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Регистрация')
          ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children:  [
                SizedBox(height: 150),
                Text('Введите данные для регистрации'),
                SizedBox(height: 10),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (login) => context
                            .read<RegistrationBloc>()
                            .add(RegistrationLoginChanged(login)),
                        decoration: InputDecoration(
                            label: Text('Логин'),
                            errorText: state.loginError == '' ? null : state.loginError
                        ),
                      );
                    }
                ),
                SizedBox(height: 10,),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (password) => context
                            .read<RegistrationBloc>()
                            .add(RegistrationPasswordChanged(password)) ,
                        decoration: InputDecoration(
                          label: Text('Пароль'),
                          errorText: state.passwordError == '' ? null : state.passwordError
                        ),
                      );
                    }
                ),
                SizedBox(height: 10),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (passwordRepeat) => context
                            .read<RegistrationBloc>()
                            .add(RegistrationPasswordRepeatChanged(passwordRepeat)),
                        decoration: InputDecoration(
                          label: Text('Повтор пароля'),
                          errorText: state.passwordRepeatError == '' ? null : state.passwordRepeatError
                        ),
                      );
                    }
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () => context
                              .read<RegistrationBloc>()
                              .add(RegistrationSubmit()),
                          child: Text('Регистрация')
                      );
                    },
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
