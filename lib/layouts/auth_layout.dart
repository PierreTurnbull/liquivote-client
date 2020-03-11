import 'package:flutter/material.dart';
import 'package:liquivote/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth layout')
      ),
      body: FlatButton(
        child: Text('Log in'),
        onPressed: () {
          Provider.of<AuthProvider>(context, listen: false).login();
        },
      )
    );
  }
}