import 'package:flutter/material.dart';

class FailedLogin extends StatelessWidget {
  const FailedLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ошибка'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Image(image: AssetImage('assets/images/failed.png'),),
        ),
      ),
    );
  }
}