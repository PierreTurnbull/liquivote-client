import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:liquivote/tools/network.dart';

class AuthProvider with ChangeNotifier {
  String _accessToken;
  final Network _network = Network();

  bool get isAuthenticated => _accessToken != null;

  dynamic login(Map<String, String> loginData) async {
    final response = await _network.post('http://127.0.0.1:3000/auth/login', body: jsonEncode({
      'username': loginData['username'],
      'password': loginData['password']
    }));
    if (response['statusCode'] == 401) {
      // print('401 cant login.');
    } else {
      // print('login ! ' + response['access_token']);
      _accessToken = response['body']['access_token'];
      _network.setAuthorization(_accessToken);
    }
    notifyListeners();
  }

  dynamic logout() {
    _accessToken = null;
    notifyListeners();
    // print('logout ! ' + _accessToken.toString());
  }
}