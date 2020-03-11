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
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                    // :) :) :)
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      height: 25,
                      child: FlatButton(
                        child: Text('shortcut for the lazy :)', style: TextStyle(color: Color.fromARGB(255, 90, 150, 185)),),
                        color: Color.fromARGB(255, 170, 190, 255),
                        onPressed: () {
                          Provider.of<AuthProvider>(context, listen: false).login(
                            {
                              'username': 'joe',
                              'password': 'pass'
                            }
                          );
                        }
                      )
                    ),
                    // :) :) :)
                      _buildUsernameField(),
                      _buildPasswordField(),
                      _buildSubmitButton()
                    ]
                  )
                )
              ),
            ]
          )
        )
      ]
    );
  }

  Widget _buildUsernameField() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'example: joe'
        ),
        onChanged: (value) { _loginData['username'] = value; },
      )
    );
  }

  Widget _buildPasswordField() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'example: pass'
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) { _loginData['password'] = value; },
      )
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: FlatButton(
        child: Text('Log in'),
        color: Colors.blue,
        onPressed: () {
          Provider.of<AuthProvider>(context, listen: false).login(
            _loginData
          );
        },
      )
    );
  }
}