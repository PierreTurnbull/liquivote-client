// import 'dart:async';

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String _accessToken;

  bool get isAuthenticated => _accessToken != null;

  dynamic login() async {
    final response = await http.post('http://127.0.0.1:3000/auth/login', body: {
      'username': 'joe',
      'password': 'pass'
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
  // static const String STORAGE_KEY = 'userData';
  // static const int SESSION_MINIMUM_DURATION = 300;

  // final Network _network = Network();
  // String _accessToken;
  // String _refreshToken;
  // DateTime _expiryDate;
  // Timer _authTimer;

  // bool get isAuth => token != null;

  // String get token {
  //   if (_expiryDate != null &&
  //       _expiryDate.isAfter(DateTime.now()) &&
  //       _accessToken != null) {
  //     return _accessToken;
  //   }
  //   return null;
  // }

  // Future<void> login(String realm, String login, String password) async {
  //   final url = '${env.apiUrl}auth/login';
  //   var response = await _network.post(
  //     url,
  //     body: {
  //       'login': login,
  //       'password': password
  //     },
  //     headers: { 'realm': realm }
  //   );

  //   _updateState(response['accessToken'], response['refreshToken']);
  // }

  // Future<void> register(String realm, String email, String password) async {
  //   final url = '${env.apiUrl}auth/register';
  //   await _network.post(
  //     url,
  //     body: {
  //       'email': email,
  //       'password': password
  //     },
  //     headers: { 'realm': realm }
  //   );
  //   login(realm, email, password);
  // }



  // Future<void> _refreshSession(String refreshToken) async {
  //   final url = '${env.apiUrl}auth/token';
  //   try {
  //     var response = await _network.post(
  //       url,
  //       body: { 'token': refreshToken, },
  //     );
  //     _updateState(response['accessToken'], response['refreshToken']);
  //   } catch (error) {
  //     logout();
  //   }
  // }

  // void _updateState(String accessToken, String refreshToken) {
  //   _accessToken = accessToken;
  //   _refreshToken = refreshToken;

  //   final user = Jwt.parse(_accessToken);
  //   _expiryDate = DateTime.fromMillisecondsSinceEpoch(user['exp'] * 1000);

  //   _network.setAuthorization(_accessToken);
  //   _autoLogBackIn();
  //   _saveSession();
  //   notifyListeners();
  // }

  // void _saveSession() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userData = json.encode(
  //     {
  //       'accessToken': _accessToken,
  //       'refreshToken': _refreshToken,
  //       'expiryDate': _expiryDate.toIso8601String(),
  //     },
  //   );
  //   prefs.setString(STORAGE_KEY, userData);
  // }

  // Future<bool> tryAutoLogin() async {
  //   // Check persisted data
  //   final prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey(STORAGE_KEY)) { return false; }

  //   // Check if token is valid or perform refresh it
  //   final userData = json.decode(prefs.getString(STORAGE_KEY)) as Map<String, Object>;
  //   final expiryDate = DateTime.parse(userData['expiryDate']);
  //   if (expiryDate.difference(DateTime.now()).inSeconds < SESSION_MINIMUM_DURATION) {
  //     await _refreshSession(userData['refreshToken']);
  //     return true;
  //   }

  //   // Restore session
  //   _updateState(userData['accessToken'], userData['refreshToken']);
  //   return true;
  // }

  // Future<void> logout() async {
  //   _accessToken = null;
  //   _expiryDate = null;
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //     _authTimer = null;
  //   }
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   notifyListeners();
  // }

  // void _autoLogBackIn() {
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //   }
  //   final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
  //   _authTimer = Timer(Duration(seconds: timeToExpiry), tryAutoLogin);
  // }
}