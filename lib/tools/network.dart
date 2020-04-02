import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Network {
  // next three lines makes this class a Singleton
  static Network _instance = new Network.internal();
  Network.internal() : this._headers = { 'Content-Type': 'application/json' };
  factory Network() => _instance;

  Map<String, String> _headers = {};

  dynamic getFormattedResponse(dynamic response) {
    return {
      'statusCode': response.statusCode,
      'body': jsonDecode(response.body)
    };
  }

  Future<dynamic> get(String url, { Map<String, String>headers }) {
    return http
      .get(url, headers: getHeaders(headers))
      .then((http.Response response) {
        return getFormattedResponse(response);
      }
    );
  }

  Future<dynamic> post(String url, { Map<String, String>headers, String body }) {
    return http
      .post(url, body: body, headers: getHeaders(headers))
      .then((http.Response response) {
        return getFormattedResponse(response);
      });
  }

  Future<dynamic> update(String url, { Map<String, String>headers, String body }) {
    return http
      .put(url, body: body, headers: getHeaders(headers))
      .then((http.Response response) {
        return getFormattedResponse(response);
      });
  }

  Map<String, String> getHeaders (Map<String, String> headers) {
    if (headers == null) return _headers;
    return {}..addAll(_headers)..addAll(headers);
  }

  void setAuthorization (String token) {
    _headers.addAll({ HttpHeaders.authorizationHeader: 'Bearer $token' });
  }
}