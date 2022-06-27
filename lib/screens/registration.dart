import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/generated/l10n.dart';

import 'package:login_app/registration/registration_bloc.dart';
import 'package:login_app/registration/registration_event.dart';
import 'package:login_app/registration/registration_state.dart';
import 'package:login_app/services/transform_key_to_error.dart';


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
            title: Text(S.of(context).registration)
            ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children:  [
                  const SizedBox(height: 150),
                  Text(S.of(context).enterTheRegistrationDetails),
                  const SizedBox(height: 10),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return TextField(
                          textInputAction: TextInputAction.next,
                          onChanged: (login) => context
                              .read<RegistrationBloc>()
                              .add(RegistrationLoginChanged(login)),
                          decoration: InputDecoration(
                              label: Text(S.of(context).login),
                              errorText: state.loginError == '' ? null : getErrorTranslation(context, state.loginError)
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 10,),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return TextField(
                          textInputAction: TextInputAction.next,
                          obscureText: !state.showPassword,
                          obscuringCharacter: '*',
                          onChanged: (password) => context
                              .read<RegistrationBloc>()
                              .add(RegistrationPasswordChanged(password)) ,
                          decoration: InputDecoration(
                            suffix: GestureDetector(
                              onTap: () {
                                context.read<RegistrationBloc>()
                                    .add(const RegistrationShowPassword());
                              },
                              child: Icon(
                                  state.showPassword ? Icons.visibility : Icons.visibility_off
                              ),
                            ),
                            label: Text(S.of(context).password),
                            errorText: state.passwordError == '' ? null : getErrorTranslation(context, state.passwordError)
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
                          obscureText: !state.showPasswordRepeat,
                          obscuringCharacter: '*',
                          onChanged: (passwordRepeat) => context
                              .read<RegistrationBloc>()
                              .add(RegistrationPasswordRepeatChanged(passwordRepeat)),
                          decoration: InputDecoration(
                            suffix: GestureDetector(
                              onTap: () {
                                context.read<RegistrationBloc>().add(const RegistrationShowPasswordRepeat());
                              },
                              child: Icon(
                                state.showPasswordRepeat ? Icons.visibility : Icons.visibility_off
                              ),
                            ),
                            label: Text(S.of(context).repeatPassword),
                            errorText: state.passwordRepeatError == '' ? null : getErrorTranslation(context, state.passwordRepeatError)
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
                            child: Text(S.of(context).registration)
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
