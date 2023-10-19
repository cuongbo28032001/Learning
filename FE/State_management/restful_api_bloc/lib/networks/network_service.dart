import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer' as dev;
import 'network_helper.dart';

enum RequestType { get, put, post, delete }

class NetworkService {
  const NetworkService._();

  static Map<String, String> _getHeaders() => {
        'Content-Type': 'application/json',
      };

  static Future<http.Response>? _createRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    if (requestType == RequestType.get) {
      return http.get(uri, headers: headers);
    }
    if (requestType == RequestType.post) {
      return http.post(uri, headers: headers, body: body);
    }
    if (requestType == RequestType.put) {
      return http.put(uri, headers: headers, body: jsonEncode(body));
    }
    if (requestType == RequestType.delete) {
      return http.delete(uri, headers: headers);
    }
    return null;
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      final header = _getHeaders();
      final urls = NetworkHelper.concatUrlQP(url, queryParam);

      final response = await _createRequest(
          requestType: requestType,
          uri: Uri.parse(urls),
          headers: header,
          body: body);

      dev.log('$urls status code ${response!.statusCode}');

      return response;
    } catch (e) {
      return null;
    }
  }
}
