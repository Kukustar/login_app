import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/authentication/authentication_repository.dart';
import 'package:login_app/forgot_password/forgot_password_bloc.dart';
import 'package:login_app/forgot_password/forgot_password_event.dart';
import 'package:login_app/forgot_password/forgot_password_state.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context){
          return ForgotPasswordBloc(
              repository: RepositoryProvider.of<AuthenticationRepository>(context)
          );
        },
        child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text('Восстановление')),
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 150),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (login) => context
                            .read<ForgotPasswordBloc>()
                            .add(ForgotPasswordLoginChanged(login)
                        ),
                        decoration: InputDecoration(
                          label: Text('Логин'),
                          errorText: state.loginError == '' ? null : state.loginError
                        ),
                      );
                    }
                ),
                SizedBox(height: 10),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (memorableWorld) => context
                            .read<ForgotPasswordBloc>()
                            .add(ForgotPasswordMemorableWorldChange(memorableWorld)
                        ),
                        decoration: InputDecoration(
                          label: Text('Ключ для восстановления'),
                          errorText: state.memorableWorldError == '' ? null : state.memorableWorldError
                        ),
                      );
                    }
                ),
                SizedBox(height: 10),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      return TextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        onChanged: (newPassword) => context
                            .read<ForgotPasswordBloc>()
                            .add(ForgotPasswordNewPasswordChanged(newPassword)
                        ),
                        decoration: InputDecoration(
                          label: Text('Новый пароль'),
                          errorText: state.newPasswordError == '' ? null : state.newPasswordError
                        ),
                      );
                    }
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<ForgotPasswordBloc>().add(const ForgotPasswordSubmit());
                        },
                        child: const Text('Восстановить'),
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