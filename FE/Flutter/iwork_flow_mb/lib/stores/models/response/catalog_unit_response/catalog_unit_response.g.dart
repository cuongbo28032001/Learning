// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_unit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogUnitResponse _$CatalogUnitResponseFromJson(Map<String, dynamic> json) =>
    CatalogUnitResponse(
      id: json['id'] as int?,
      parentId: json['parentId'] as int?,
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
      parent: json['parent'] == null
          ? null
          : CatalogUnitResponse.fromJson(
              json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CatalogUnitResponseToJson(
        CatalogUnitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'title': instance.title,
      'description': instance.description,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'lastModifiedBy': instance.lastModifiedBy,
      'parent': instance.parent,
    };
