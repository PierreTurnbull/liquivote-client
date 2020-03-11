import 'package:flutter/material.dart';
import 'package:liquivote/screens/login_screen.dart';

class AuthLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth layout')
      ),
      body: LoginScreen()
    );
  }
}