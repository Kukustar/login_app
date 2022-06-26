import 'package:flutter/material.dart';
import 'package:login_app/screens/login/login.dart';
import 'package:login_app/screens/registration.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Авторизация"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Добро пожаловать в приложение, войдите или зарегестраруйтесь',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login())
                      );
                    },
                    child: const Text('Вход')
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Registration())
                      );
                    },
                    child: const Text('Регистрация')
                ),
              ),
            ],
          ),
        )
    );
  }
}