import 'package:flutter/material.dart';
import 'package:liquivote/screens/login_screen.dart';

class AuthLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication')
      ),
      backgroundColor: Color.fromARGB(255, 240, 240, 255),
      body: LoginScreen()
    );
  }
}