import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login_app/authentication/authentication_bloc.dart';
import 'package:login_app/authentication/authentication_event.dart';
import 'package:login_app/authentication/authentication_state.dart';
import 'package:login_app/generated/l10n.dart';

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
        title: Text(S.of(context).successfulAuthorization),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children:  [
            const SizedBox(height: 100),
            const Image(image: AssetImage('assets/images/success.png')),
            const SizedBox(height: 50),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return state.memorableWorld.isNotEmpty ? Column(
                  children: [
                    Text(
                      S.of(context).saveKeyForPasswordRecovery,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.memorableWorld,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
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