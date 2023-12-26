// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_flow_definition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkFlowDefinitionResponse _$WorkFlowDefinitionResponseFromJson(
        Map<String, dynamic> json) =>
    WorkFlowDefinitionResponse(
      id: json['id'] as int?,
      code: json['code'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      latestVersion: json['latestVersion'] as String?,
      totalVersion: json['totalVersion'] as int?,
      totalInstance: json['totalInstance'] as int?,
      readme: json['readme'] as String?,
      space: json['space'] == null
          ? null
          : SpaceResponse.fromJson(json['space'] as Map<String, dynamic>),
      folder: json['folder'] == null
          ? null
          : FolderResponse.fromJson(json['folder'] as Map<String, dynamic>),
      managers: (json['managers'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
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

Map<String, dynamic> _$WorkFlowDefinitionResponseToJson(
        WorkFlowDefinitionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'latestVersion': instance.latestVersion,
      'totalVersion': instance.totalVersion,
      'totalInstance': instance.totalInstance,
      'readme': instance.readme,
      'space': instance.space,
      'folder': instance.folder,
      'managers': instance.managers,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'lastModifiedBy': instance.lastModifiedBy,
    };
