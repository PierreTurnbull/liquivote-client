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
          _buildUsernameField(),
          _buildPasswordField(),
          _buildSubmitButton()
        ]
      )
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'example: joe'
      ),
      onChanged: (value) { _loginData['username'] = value; },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'example: pass'
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      onChanged: (value) { _loginData['password'] = value; },
    );
  }

  Widget _buildSubmitButton() {
    return FlatButton(
      child: Text('Log in'),
      color: Colors.blue,
      onPressed: () {
        Provider.of<AuthProvider>(context, listen: false).login(
          _loginData
        );
      },
    );
  }
}