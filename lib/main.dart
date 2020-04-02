import 'package:flutter/material.dart';
import 'package:liquivote/layouts/auth_layout.dart';
import 'package:liquivote/layouts/app_layout.dart';
import 'package:liquivote/providers/auth_provider.dart';
import 'package:liquivote/providers/data_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider(context)),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, authProvider, _) => MaterialApp(
          title: 'LiquiVote',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: authProvider.isAuthenticated
            ? AppLayout()
            : AuthLayout()
        )
      )
    );
  }
}
