// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderResponse _$FolderResponseFromJson(Map<String, dynamic> json) =>
    FolderResponse(
      id: json['id'] as int?,
      code: json['code'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      spaceId: json['spaceId'] as int?,
      parentId: json['parentId'] as int?,
    );

Map<String, dynamic> _$FolderResponseToJson(FolderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'spaceId': instance.spaceId,
      'parentId': instance.parentId,
    };
