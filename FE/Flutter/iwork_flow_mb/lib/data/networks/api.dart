// ignore_for_file: constant_identifier_names
library api;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

import 'package:iwork_flow_mb/data/networks/config.dart';

class Api {
  static const String CONTENT_TYPE_APPLICATON_JSON = 'application/json';
  static const String HEADER_CONTENT_TYPE = 'content-type';
  // static const String LANGUAGE_CODE = 'language';
  static const String HEADER_AUTHORIZATION = 'Authorization';

  // static HttpClientRequest? _latestRequest;

  static getAuthorization() {
    // final localUser = localStorage.getItem('currentUser');
    // if (localUser != null) {
    // LoginResponse currentUser = LoginResponse.fromJson(localUser);
    // final token = currentUser.token;
    // final type = currentUser.type;
    String type = 'Bearer';
    String token =
        'eyJraWQiOiI5OTVmOGVlZS0xNTdlLTQzZDMtYWFhNC05OGU0OGI5NDYyYTgiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhZG1pbkBpd29ya2Zsb3cuY29tIiwiYXVkIjoid29ya2Zsb3dsYWV6LXdlYiIsInVpZCI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMSIsIm5iZiI6MTcwMzQ2OTAwOSwicGVybWlzc2lvbnMiOlsicmVhZDpyb2xlIiwicmVhZDpkcml2ZSIsInJlYWQ6YXBwIiwid3JpdGU6c2luZ2xlX3Rhc2tfY29uZmlnIiwicmVhZDpzZXR0aW5nIiwid3JpdGU6ZGF0YWJhc2UiLCJyZWFkOndvcmtmbG93Iiwid3JpdGU6YXBwIiwid3JpdGU6Z3JvdXAiLCJ3cml0ZTp1c2VyIiwid3JpdGU6ZHJpdmUiLCJ3cml0ZTpzZXR0aW5nIiwicmVhZDpkYXRhYmFzZSIsIndyaXRlOmZpbGUiLCJyZWFkOnNpbmdsZV90YXNrX2NvbmZpZyIsInJlYWQ6ZmlsZSIsInJlYWQ6Z3JvdXAiLCJyZWFkOnVzZXIiLCJ3cml0ZTpmb3JtIiwid3JpdGU6cm9sZSIsInJlYWQ6Zm9ybSIsIndyaXRlOndvcmtmbG93Il0sImlzcyI6Imh0dHBzOlwvXC9pd29ya2Zsb3ctYXV0aC5sbHEudm4iLCJuYW1lIjoiU3VwZXIgQWRtaW5pc3RyYXRvciIsImV4cCI6MTcwMzUwNTAwOSwiaWF0IjoxNzAzNDY5MDA5fQ.SpJmfI0C5k1Alo4tJcrvUV4AB7ZqUolmCjd4QLZzjX0v_doN8uOE1vW2kzgLiFGuIfSlJ0BiwB3o_6lEJGv7UGSwg17XGvn98ig9-WJMvgmsgF393b0p2C1sw4f87Yy47doDX5XV_Q_kAIHJEsz_3VYIlls8fE-CwBUHrCW7bty_5zAIQZbq0vIVmFUbSX8skjM4zTlWOgcwZujcbeTDcePLr3WpGH-45drOG8U5iFhEPeWvDEV8urrqFqwKIFKYMcd-pg3p5IUY1rY_LcQZa4PUDSbzeHfKAYKUfwYAA_CjCaX1Kt_f44wCM5B1EIwQKE7vVwTEus_SHylZehUwkA';
    return "$type $token";
    // }
    // return "";
  }

  static Map<String, String> getCommonHeaders() {
    Map<String, String> headers = {};
    // final languageCode = sharedpf.getLocalLanguage();
    headers[HEADER_CONTENT_TYPE] = CONTENT_TYPE_APPLICATON_JSON;
    // headers[LANGUAGE_CODE] = languageCode?.toUpperCase() ?? "VI";
    String authorization = getAuthorization();
    if (authorization.isNotEmpty) {
      headers[HEADER_AUTHORIZATION] = authorization;
    }
    return headers;
  }

  // static Future<LoginResponse?> login(LoginRequest loginRequest) async {
  //   await Firebase.initializeApp();
  //   var deviceInfo = await DeviceUtils.getDeviceInfo();

  //   String? token = await FirebaseMessaging.instance.getToken();
  //   dev.log(token.toString());
  //   var device = {
  //     "modelId": deviceInfo.devModelId,
  //     "manufacturer": deviceInfo.devManufacturer,
  //     "systemName": deviceInfo.devSystemName,
  //     "systemVersion": deviceInfo.devSystemVersion,
  //     "emulator": deviceInfo.devEmulator ? "Y" : "N",
  //     "firebaseToken": token,
  //   };
  //   loginRequest.device = device;
  //   var finalRequestBody = GatewayService.encryptAES(loginRequest);
  //   try {
  //     var response = await http.post(Uri.parse('$baseUrl/api/auth/signin'),
  //         headers: getCommonHeaders(), body: finalRequestBody);
  //     dev.log('$baseUrl/api/auth/signin');
  //     if (response.statusCode == 200) {
  //       // LoginResponse responseLogin =
  //       //     LoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  //       Map<String, dynamic> responseJson =
  //           GatewayService.decryptAES(response.body);
  //       LoginResponse responseLogin = LoginResponse.fromJson(responseJson);
  //       localStorage.setItem("currentUser", responseLogin);
  //       return responseLogin;
  //       // LoginResponse responseLogin =
  //       //     LoginResponse.fromJson(responseLogin);
  //     } else if (response.statusCode == 401) {
  //       return null;
  //     } else {
  //       throw Exception('Failed to load');
  //     }
  //   } catch (e) {
  //     dev.log(e.toString());
  //     return null;
  //   }
  // }

  // static searchRequest(path, queryParameters) async {
  //   _latestRequest?.abort();
  //   HttpClient client = HttpClient();
  //   Map<String, String> headers = getCommonHeaders();
  //   var url = baseUrl + getFullUrlWithParams(path, queryParameters);
  //   try {
  //     // Gửi yêu cầu
  //     HttpClientRequest request = await client.getUrl(Uri.parse(url));
  //     headers.forEach((key, value) {
  //       request.headers.add(key, value);
  //     });
  //     _latestRequest = request;
  //     HttpClientResponse response = await request.close();

  //     dev.log('get $baseUrl$path status code ${response.statusCode}');
  //     var responeString = await response.transform(utf8.decoder).join();
  //     if (response.statusCode == 200) {
  //       try {
  //         return GatewayService.decryptAES(responeString);
  //       } catch (_) {}
  //       return json.decode(responeString);
  //     } else if (response.statusCode == 401) {
  //       goUnauthorizedWidget();
  //     } else {
  //       throw Exception('Failed to load');
  //     }
  //   } catch (error) {
  //     // Xử lý lỗi (nếu có)
  //     dev.log('error: ${error.toString()}');
  //     return {
  //       "errorCode": null,
  //       "errorMessage": null,
  //       "data": null,
  //     };
  //   } finally {
  //     client.close();
  //   }
  // }

  static httpGet(path, queryParameters) async {
    var url = baseUrl + getFullUrlWithParams(path, queryParameters);
    var response = await http.get(Uri.parse(url), headers: getCommonHeaders());
    dev.log('get $url status code ${response.statusCode}');
    if (response.statusCode == 200) {
      try {
        return json.decode(utf8.decode(response.bodyBytes));
      } catch (_) {
        //bypass
      }
      return utf8.decode(response.bodyBytes);
    } else if (response.statusCode == 401) {
      // goUnauthorizedWidget();
    } else {
      throw Exception('Failed to load');
    }
  }

  static httpPost(url, request) async {
    var response = await http.post(Uri.parse('$baseUrl$url'),
        headers: getCommonHeaders(), body: request);
    dev.log('post $baseUrl$url status code ${response.statusCode}');
    if (response.statusCode == 200) {
      if (response.headers[HEADER_CONTENT_TYPE] ==
          CONTENT_TYPE_APPLICATON_JSON) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } on FormatException {
          //bypass
        }
      }
      return utf8.decode(response.bodyBytes);
    } else if (response.statusCode == 401) {
      // goUnauthorizedWidget();
    } else {
      throw Exception('Failed to load');
    }
  }

  static httpPut(url, request) async {
    var response = await http.put(Uri.parse('$baseUrl$url'),
        headers: getCommonHeaders(), body: request);
    dev.log('put $baseUrl$url status code ${response.statusCode}');
    dev.log('body: ${json.encode(request)}');
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        if (response.headers[HEADER_CONTENT_TYPE] ==
            CONTENT_TYPE_APPLICATON_JSON) {
          try {
            if (response.bodyBytes.isNotEmpty) {
              return json.decode(utf8.decode(response.bodyBytes));
            }
            return true;
          } on FormatException {
            //bypass
          }
        }
        return utf8.decode(response.bodyBytes);
      }
      return true;
    } else if (response.statusCode == 401) {
      // goUnauthorizedWidget();
      return null;
    } else {
      throw Exception('Failed to load');
    }
  }

  static httpDelete(id) async {
    var response = await http.delete(Uri.parse('$baseUrl/$id'),
        headers: getCommonHeaders());
    dev.log('delete $baseUrl/$id status code ${response.statusCode}');
    if (response.statusCode == 200) {
      if (response.headers[HEADER_CONTENT_TYPE] ==
          CONTENT_TYPE_APPLICATON_JSON) {
        try {
          return json.decode(utf8.decode(response.bodyBytes));
        } on FormatException {
          //bypass
        }
      }
      return utf8.decode(response.bodyBytes);
    } else if (response.statusCode == 401) {
      // goUnauthorizedWidget();
    } else {
      throw Exception('Failed to load');
    }
  }

  // static goUnauthorizedWidget() {
  //   navigatorKey.currentState?.pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => const LoginPageWidget()),
  //       (route) => route.isFirst);
  //   // Navigator.of(context)
  //   //     .push(MaterialPageRoute(builder: (context) => const LoginWidget()));
  // }

  static getFullUrlWithParams(api, Map? payload) {
    if (payload != null && payload.isNotEmpty) {
      var keys = payload.keys;
      String params = '';
      for (String key in keys) {
        if (payload[key] != null && payload[key] != '') {
          String value = payload[key].toString();
          params += params.isEmpty ? '?$key=$value' : '&$key=$value';
        }
      }
      return '$api$params';
    }

    return api;
  }
}
