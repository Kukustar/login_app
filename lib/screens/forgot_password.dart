import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_app/forgot_password/forgot_password_bloc.dart';
import 'package:login_app/forgot_password/forgot_password_event.dart';
import 'package:login_app/forgot_password/forgot_password_state.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
              .of<ForgotPasswordBloc>(context, listen: false)
              .add(const ClearForgotPasswordState());

          return Future.value(true);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: const Text('Восстановление')),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      builder: (context, state) {
                    return TextField(
                      textInputAction: TextInputAction.next,
                      onChanged: (login) => context
                          .read<ForgotPasswordBloc>()
                          .add(ForgotPasswordLoginChanged(login)),
                      decoration: InputDecoration(
                          label: const Text('Логин'),
                          errorText:
                              state.loginError == '' ? null : state.loginError),
                    );
                  }),
                  const SizedBox(height: 10),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      builder: (context, state) {
                    return TextField(
                      textInputAction: TextInputAction.next,
                      onChanged: (memorableWorld) => context
                          .read<ForgotPasswordBloc>()
                          .add(ForgotPasswordMemorableWorldChange(memorableWorld)),
                      decoration: InputDecoration(
                          label: const Text('Ключ для восстановления'),
                          errorText: state.memorableWorldError == ''
                              ? null
                              : state.memorableWorldError),
                    );
                  }),
                  const SizedBox(height: 10),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      builder: (context, state) {
                    return TextField(
                      onSubmitted: (_) {
                        context
                            .read<ForgotPasswordBloc>()
                            .add(const ForgotPasswordSubmit());
                      },
                      obscureText: true,
                      obscuringCharacter: '*',
                      onChanged: (newPassword) => context
                          .read<ForgotPasswordBloc>()
                          .add(ForgotPasswordNewPasswordChanged(newPassword)),
                      decoration: InputDecoration(
                          label: const Text('Новый пароль'),
                          errorText: state.newPasswordError == ''
                              ? null
                              : state.newPasswordError),
                    );
                  }),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            FocusScopeNode currentFocus = FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            context
                                .read<ForgotPasswordBloc>()
                                .add(const ForgotPasswordSubmit());
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
      ),
    );
  }
}
