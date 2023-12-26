// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

const String CONTENT_TYPE_APPLICATON_JSON = 'application/json';
const String HEADER_CONTENT_TYPE = 'content-type';
const String HEADER_AUTHORIZATION = 'Authorization';

Map<String, String> getCommonHeaders() {
  Map<String, String> headers = {};
  headers[HEADER_CONTENT_TYPE] = CONTENT_TYPE_APPLICATON_JSON;
  return headers;
}

Future httpPost() async {
  final Map<String, String> data = {
    'username': '1',
    'password': '1',
    // Add more key-value pairs as needed
  };

  var response = await http.post(
      Uri.parse('http://10.1.0.239:9000/auth/login-mb'),
      headers: getCommonHeaders(),
      body: json.encode(data));
  if (response.statusCode == 200) {
    print(response.body);
    return utf8.decode(response.bodyBytes);
  } else if (response.statusCode == 401) {
    // goUnauthorizedWidget();
  } else {
    throw Exception('Failed to load');
  }
}
