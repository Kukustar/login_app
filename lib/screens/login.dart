import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:login_app/login/login_bloc.dart';
import 'package:login_app/login/login_event.dart';
import 'package:login_app/login/login_state.dart';
import 'package:login_app/screens/forgot_password.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
              .of<LoginBloc>(context, listen: false)
              .add(const ClearLoginState());

          return Future.value(true);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Вход'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return TextField(
                        textInputAction: TextInputAction.next,
                        onChanged: (login) => context
                            .read<LoginBloc>()
                            .add(LoginLoginChanged(login)),
                        decoration: InputDecoration(
                          label: const Text('Логин'),
                          errorText: state.loginError == '' ? null : state.loginError
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return TextField(
                          onSubmitted: (_) {
                            context.read<LoginBloc>().add(const LoginSubmit());
                          },
                          obscureText: !state.showPassword,
                          obscuringCharacter: '*',
                          onChanged: (password) => context
                              .read<LoginBloc>()
                              .add(LoginPasswordChanged(password)),
                          decoration: InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  context.read<LoginBloc>().add(const LoginShowPassword());
                                },
                                child: Icon(
                                    state.showPassword ? Icons.visibility : Icons.visibility_off
                                ),
                              ),
                              label: const Text('Пароль'),
                              errorText: state.passwordError == '' ? null : state.passwordError
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                                  builder: (_) => const ForgotPassword()
                              )
                          );
                        },
                        child: const Text('Забыли пароль?')
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            FocusScopeNode currentFocus = FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            context.read<LoginBloc>().add(const LoginSubmit());
                          },
                          child: const Text('Вход'),
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