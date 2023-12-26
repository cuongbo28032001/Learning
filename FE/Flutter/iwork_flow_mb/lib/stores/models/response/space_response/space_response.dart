import 'package:iwork_flow_mb/stores/commons/enums/space_scope.dart';
import 'package:iwork_flow_mb/stores/models/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'space_response.g.dart';

@JsonSerializable()
class SpaceResponse {
  int? id;
  String? code;
  String? title;
  String? description;
  EnumSpaceScope? scope;
  String? createdDate;
  UserResponse? createdBy;
  String? lastModifiedDate;
  UserResponse? lastModifiedBy;

  SpaceResponse(
      {this.id,
      this.code,
      this.title,
      this.description,
      this.scope,
      this.createdDate,
      this.createdBy,
      this.lastModifiedDate,
      this.lastModifiedBy});

  factory SpaceResponse.fromJson(Map<String, dynamic> json) =>
      _$SpaceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceResponseToJson(this);
}
