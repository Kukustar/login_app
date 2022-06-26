import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_app/registration/registration_bloc.dart';
import 'package:login_app/registration/registration_event.dart';
import 'package:login_app/registration/registration_state.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () {
          BlocProvider
              .of<RegistrationBloc>(context, listen: false)
              .add(const ClearRegistrationState());

          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Регистрация')
            ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children:  [
                  const SizedBox(height: 150),
                  const Text('Введите данные для регистрации'),
                  const SizedBox(height: 10),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return TextField(
                          textInputAction: TextInputAction.next,
                          onChanged: (login) => context
                              .read<RegistrationBloc>()
                              .add(RegistrationLoginChanged(login)),
                          decoration: InputDecoration(
                              label: const Text('Логин'),
                              errorText: state.loginError == '' ? null : state.loginError
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 10,),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return TextField(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          obscuringCharacter: '*',
                          onChanged: (password) => context
                              .read<RegistrationBloc>()
                              .add(RegistrationPasswordChanged(password)) ,
                          decoration: InputDecoration(
                            label: const Text('Пароль'),
                            errorText: state.passwordError == '' ? null : state.passwordError
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return TextField(
                          onSubmitted: (_) {
                            context
                                .read<RegistrationBloc>()
                                .add(const RegistrationSubmit());
                          },
                          obscureText: true,
                          obscuringCharacter: '*',
                          onChanged: (passwordRepeat) => context
                              .read<RegistrationBloc>()
                              .add(RegistrationPasswordRepeatChanged(passwordRepeat)),
                          decoration: InputDecoration(
                            label: const Text('Повтор пароля'),
                            errorText: state.passwordRepeatError == '' ? null : state.passwordRepeatError
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              FocusScopeNode currentFocus = FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                              context
                                  .read<RegistrationBloc>()
                                  .add(const RegistrationSubmit());
                            },
                            child: const Text('Регистрация')
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}
