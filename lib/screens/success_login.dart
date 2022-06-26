import 'package:flutter/material.dart';

class SuccessLogin extends StatefulWidget {
  const SuccessLogin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SuccessLoginState();
  }
}

class _SuccessLoginState extends State<SuccessLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Успешная авторизация'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Image(image: AssetImage('assets/images/success.png'),),
        ),
      ),
    );
  }
  
}