import 'package:json_annotation/json_annotation.dart';

part 'baseresponse_model.g.dart';

@JsonSerializable()
class BaseResponse {
  String errorCode;
  String errorMessage;
  dynamic data;

  BaseResponse(this.errorCode, this.errorMessage, this.data);
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
