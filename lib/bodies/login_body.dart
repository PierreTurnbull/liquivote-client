import 'package:flutter/material.dart';
import 'package:liquivote/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Log in'),
      color: Colors.blue,
      onPressed: () {
        Provider.of<AuthProvider>(context, listen: false).login();
      },
    );
  }
}