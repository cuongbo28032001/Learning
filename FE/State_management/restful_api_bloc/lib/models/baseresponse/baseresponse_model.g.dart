// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baseresponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      json['errorCode'] as String,
      json['errorMessage'] as String,
      json['data'],
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'data': instance.data,
    };
