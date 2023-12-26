import 'package:iwork_flow_mb/stores/models/response/folder_response/folder_response.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';
import 'package:iwork_flow_mb/stores/models/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'work_flow_definition_response.g.dart';

@JsonSerializable()
class WorkFlowDefinitionResponse {
  int? id;
  String? code;
  String? title;
  String? description;
  String? status;
  String? latestVersion;
  int? totalVersion;
  int? totalInstance;
  String? readme;
  SpaceResponse? space;
  FolderResponse? folder;
  List<UserResponse>? managers;
  String? createdDate;
  UserResponse? createdBy;
  String? lastModifiedDate;
  UserResponse? lastModifiedBy;

  WorkFlowDefinitionResponse(
      {this.id,
      this.code,
      this.title,
      this.description,
      this.status,
      this.latestVersion,
      this.totalVersion,
      this.totalInstance,
      this.readme,
      this.space,
      this.folder,
      this.managers,
      this.createdDate,
      this.createdBy,
      this.lastModifiedDate,
      this.lastModifiedBy});

  factory WorkFlowDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkFlowDefinitionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WorkFlowDefinitionResponseToJson(this);
}
