import 'dart:convert';

import 'package:bloc_bloc/data/networks/config.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

class API {
  Future httpGet(path, queryParameters) async {
    var url = baseUrl + getFullUrlWithParams(path, queryParameters);
    try {
      var response = await http.get(Uri.parse(url));
      dev.log('get $url status code  ${response.statusCode}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future httpPut(path, id) async {
    try {
      var response = await http.put(Uri.parse('$baseUrl$path/$id'));
      dev.log('put $baseUrl$path status code ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future httpPost(path, request) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl$path'), body: request);
      dev.log('put $baseUrl$path status code ${response.statusCode}');
      dev.log('body: ${json.encode(request)}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future httpDelete(path, id) async {
    try {
      var response = await http.delete(Uri.parse('$baseUrl$path/$id'));
      dev.log('put $baseUrl$path status code ${response.statusCode}');
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  static getFullUrlWithParams(path, Map? payload) {
    if (payload != null && payload.isNotEmpty) {
      var keys = payload.keys;
      String params = '';
      for (String key in keys) {
        if (payload[key] != null && payload[key] != '') {
          String value = payload[key].toString();
          params += params.isEmpty ? '?$key=$value' : '&$key=$value';
        }
      }
      return '$path$params';
    }

    return path;
  }
}
