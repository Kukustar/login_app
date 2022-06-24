import 'package:flutter/material.dart';

class SuccessLogin extends StatefulWidget {
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
        title: Text('Успешно'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Image(image: AssetImage('assets/images/success.png'),),
        ),
      ),
    );
  }
  
}