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
    return Scaffold(
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
                buildWhen: (previous, current) => previous.loginError != current.loginError,
                builder: (context, state) {
                  return TextField(
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
                  buildWhen: (previous, current) => previous.passwordError != current.passwordError,
                  builder: (context, state) {
                    return TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      onChanged: (password) => context
                          .read<LoginBloc>()
                          .add(LoginPasswordChanged(password)),
                      decoration: InputDecoration(
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
                              builder: (_) => ForgotPassword()
                          )
                      );
                    },
                    child: Text('Забыли пароль?')
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
    );
  }
}