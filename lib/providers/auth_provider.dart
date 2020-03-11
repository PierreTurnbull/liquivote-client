// import 'dart:async';

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String _accessToken;

  bool get isAuthenticated => _accessToken != null;

  dynamic login(Map<String, String> loginData) async {
    final response = await http.post('http://127.0.0.1:3000/auth/login', body: {
      'username': loginData['username'],
      'password': loginData['password']
    });
    final parsedResponse = jsonDecode(response.body);
    if (parsedResponse['statusCode'] == 401) {
      print('401 cant login.');
    } else {
      print('login ! ' + parsedResponse['access_token']);
      _accessToken = parsedResponse['access_token'];
    }
    notifyListeners();
  }

  dynamic logout() {
    _accessToken = null;
    notifyListeners();
    print('logout ! ' + _accessToken.toString());
  }
}