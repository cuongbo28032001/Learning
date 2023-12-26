import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restful_api_bloc/models/baseresponse/basepagingresponse_model.dart';
import 'package:restful_api_bloc/models/baseresponse/baseresponse_model.dart';

import 'network_enums.dart';
import 'network_typedef.dart';

class NetworkHelper {
  const NetworkHelper._();

  static String concatUrlQP(String url, Map<String, String>? queryParameters) {
    if (url.isEmpty) return url;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }

  static R filterResponse<R>({
    required NetworkCallBack<R> callBack,
    required http.Response? response,
    required NetworkOnFailureCallBackWithMessage onFailureCallBackWithMessage,
    required bool paging,
  }) {
    try {
      if (response == null || response.body.isEmpty) {
        return onFailureCallBackWithMessage(
            NetworkResponseErrorType.responseEmpty, 'empty response');
      }

      var json = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        if (json != null) {
          if (paging) {
            return callBack(BasePagingResponse.fromJson(json));
          }
          return callBack(BaseResponse.fromJson(json));
        }
      } else if (response.statusCode == 1708) {
        return onFailureCallBackWithMessage(
            NetworkResponseErrorType.socket, 'socket');
      }
      return onFailureCallBackWithMessage(
          NetworkResponseErrorType.didNotSucceed, 'unknown');
    } catch (e) {
      return onFailureCallBackWithMessage(
          NetworkResponseErrorType.exception, 'Exception $e');
    }
  }
}
