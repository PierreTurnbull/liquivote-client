import 'package:flutter/material.dart';
import 'package:liquivote/providers/auth_provider.dart';
import 'package:liquivote/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LiquiVote'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            }
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 240, 240, 255),
      body: HomeScreen()
    );
  }
}