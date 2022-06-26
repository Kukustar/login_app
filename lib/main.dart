import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/screens/authentication/authentication_bloc.dart';
import 'package:login_app/screens/authentication/authentication_repository.dart';
import 'package:login_app/screens/authentication/authentication_state.dart';
import 'package:login_app/screens/failed_login.dart';
import 'package:login_app/screens/home.dart';
import 'package:login_app/screens/success_login.dart';
import 'package:login_app/services/sqlite.dart';
import 'package:login_app/splash_page.dart';

void main() async {
  await initDatabase();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
  ));
  // BlocOverrides.runZoned(() => runApp(App()), blocObserver: LoginAppObserver());
}

class App extends StatelessWidget {
  const App({Key? key, required this.authenticationRepository}) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(repository: authenticationRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Авторизация',
        navigatorKey: _navigatorKey,
        onGenerateRoute: (_) => SplashPage.route(),
        theme: ThemeData(
            primarySwatch: Colors.blue,
            inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)))),
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {

              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      MaterialPageRoute(builder: (_) => const SuccessLogin()),
                          (route) => false);
                  break;
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      MaterialPageRoute(builder: (_) =>  const Home()),
                          (route) => false);
                  break;
                case AuthenticationStatus.failed:
                  _navigator.push<void>(
                      MaterialPageRoute(builder: (context) => const FailedLogin())
                  );
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        });
  }
}