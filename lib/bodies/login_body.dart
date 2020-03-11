import 'package:flutter/material.dart';
import 'package:liquivote/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  Map<String, String> _loginData = {
    'username': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _loginFormKey = GlobalKey();
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'joe'
            ),
            onChanged: (value) { _loginData['username'] = value; },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'pass'
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
            onChanged: (value) { _loginData['password'] = value; },
          ),
          FlatButton(
            child: Text('Log in'),
            color: Colors.blue,
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).login(
                _loginData
              );
            },
          )
        ]
      )
    );
  }
}