import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:login_app/screens/authentication/authentication_repository.dart';
import 'package:login_app/screens/login/login_bloc.dart';
import 'package:login_app/screens/login/login_event.dart';
import 'package:login_app/screens/login/login_state.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc(
            repository: RepositoryProvider.of<AuthenticationRepository>(context)
        );
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
                const SizedBox(height: 10),
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
      ),
    );
  }
}