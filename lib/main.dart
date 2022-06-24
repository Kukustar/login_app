import 'package:flutter/material.dart';
import 'package:login_app/screens/home.dart';
import 'package:login_app/services/sqlite.dart';

void main() async {
  await initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Авторизация',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
              )
          )
      ),
      home: const Home(),
    );
  }
}


