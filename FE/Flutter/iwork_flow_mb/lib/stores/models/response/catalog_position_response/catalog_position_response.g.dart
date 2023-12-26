// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_position_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogPositionResponse _$CatalogPositionResponseFromJson(
        Map<String, dynamic> json) =>
    CatalogPositionResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
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

Map<String, dynamic> _$CatalogPositionResponseToJson(
        CatalogPositionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'lastModifiedBy': instance.lastModifiedBy,
    };
