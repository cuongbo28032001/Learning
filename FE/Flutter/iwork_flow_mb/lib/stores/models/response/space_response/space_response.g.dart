// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceResponse _$SpaceResponseFromJson(Map<String, dynamic> json) =>
    SpaceResponse(
      id: json['id'] as int?,
      code: json['code'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      scope: $enumDecodeNullable(_$EnumSpaceScopeEnumMap, json['scope']),
      createdDate: json['createdDate'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : UserResponse.fromJson(json['createdBy'] as Map<String, dynamic>),
      lastModifiedDate: json['lastModifiedDate'] as String?,
      lastModifiedBy: json['lastModifiedBy'] == null
          ? null
          : UserResponse.fromJson(
              json['lastModifiedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpaceResponseToJson(SpaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'scope': _$EnumSpaceScopeEnumMap[instance.scope],
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'lastModifiedBy': instance.lastModifiedBy,
    };

const _$EnumSpaceScopeEnumMap = {
  EnumSpaceScope.PUBLIC: 'PUBLIC',
  EnumSpaceScope.RESTRICTED: 'RESTRICTED',
  EnumSpaceScope.PERSONAL: 'PERSONAL',
};
