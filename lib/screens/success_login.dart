import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/authentication/authentication_bloc.dart';
import 'package:login_app/authentication/authentication_event.dart';
import 'package:login_app/authentication/authentication_state.dart';

class SuccessLogin extends StatelessWidget {
  const SuccessLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.power_settings_new),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context, listen: false).add(const LogAut());
          },
        ),
        title: const Text('Успешная авторизация'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Image(image: AssetImage('assets/images/success.png')),
            const SizedBox(height: 100),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return state.memorableWorld.isNotEmpty ? Column(
                  children: [
                    const Text(
                        "Запомните этот ключ для восстановления пароля",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.memorableWorld),
                        IconButton(
                            onPressed: () async {
                              Clipboard.setData(
                                  ClipboardData(text: state.memorableWorld)
                              );
                            },
                            icon: const Icon(Icons.content_copy)
                        )
                      ],
                    )
                  ],
                ) : const SizedBox();
              }
            )
          ],
        ),
      ),
    );
  }
}