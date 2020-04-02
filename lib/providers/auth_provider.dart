import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:liquivote/tools/network.dart';

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}

Map<String, dynamic> getPayload(String accessToken) {
  final parts = accessToken.split('.');
  final payload = _decodeBase64(parts[1]);
  return json.decode(payload);
}

class AuthProvider with ChangeNotifier {
  String _accessToken;
  int _currentUserId;

  bool get isAuthenticated => _accessToken != null;
  int get currentUserId => _currentUserId;

  final Network _network = Network();

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
      _currentUserId = getPayload(_accessToken)['sub'];
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