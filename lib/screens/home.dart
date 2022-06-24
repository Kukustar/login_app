import 'package:flutter/material.dart';
import 'package:login_app/screens/login.dart';
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
          title: Text("Авторизация"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Добро пожаловать в приложение, войдите или зарегестраруйтесь',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login())
                      );
                    },
                    child: Text('Вход')
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Registration())
                      );
                    },
                    child: Text('Регистрация')
                ),
              ),
            ],
          ),
        )
    );
  }
}