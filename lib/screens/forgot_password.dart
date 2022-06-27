import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_app/forgot_password/forgot_password_bloc.dart';
import 'package:login_app/forgot_password/forgot_password_event.dart';
import 'package:login_app/forgot_password/forgot_password_state.dart';
import 'package:login_app/generated/l10n.dart';
import 'package:login_app/services/transform_key_to_error.dart';

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
          appBar: AppBar(title: Text(S.of(context).recovery)),
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
                          label: Text(S.of(context).login),
                          errorText:
                              state.loginError == '' ? null : getErrorTranslation(context, state.loginError)
                      ),
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
                          label: Text(S.of(context).recoveryKey),
                          errorText: state.memorableWorldError == ''
                              ? null
                              : getErrorTranslation(context, state.memorableWorldError)
                      ),
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
                      obscureText: !state.showPassword,
                      obscuringCharacter: '*',
                      onChanged: (newPassword) => context
                          .read<ForgotPasswordBloc>()
                          .add(ForgotPasswordNewPasswordChanged(newPassword)),
                      decoration: InputDecoration(
                          suffix: GestureDetector(
                            onTap: () {
                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(const ForgotPasswordShowPasswordChange());
                            },
                            child: Icon(
                                state.showPassword ? Icons.visibility : Icons.visibility_off
                            ),
                          ),
                          label: Text(S.of(context).newPassword),
                          errorText: state.newPasswordError == ''
                              ? null
                              : getErrorTranslation(context, state.newPasswordError)
                      ),
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
                          child: Text(S.of(context).recovery),
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
