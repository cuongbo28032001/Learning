// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'],
      username: json['username'] as String?,
      status: $enumDecodeNullable(_$EnumUserStatusEnumMap, json['status']),
      email: json['email'] as String?,
      name: json['name'] as String?,
      shortDescription: json['shortDescription'] as String?,
      unit: json['unit'] == null
          ? null
          : CatalogUnitResponse.fromJson(json['unit'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : CatalogDepartmentResponse.fromJson(
              json['department'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : CatalogPositionResponse.fromJson(
              json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'status': _$EnumUserStatusEnumMap[instance.status],
      'email': instance.email,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'unit': instance.unit,
      'department': instance.department,
      'position': instance.position,
    };

const _$EnumUserStatusEnumMap = {
  EnumUserStatus.ACTIVE: 'ACTIVE',
  EnumUserStatus.LOCKED: 'LOCKED',
};
