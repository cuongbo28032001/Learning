import 'package:iwork_flow_mb/stores/commons/enums/user_status.dart';
import 'package:iwork_flow_mb/stores/models/response/catalog_department_response/catalog_department_response.dart';
import 'package:iwork_flow_mb/stores/models/response/catalog_position_response/catalog_position_response.dart';
import 'package:iwork_flow_mb/stores/models/response/catalog_unit_response/catalog_unit_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  dynamic id;
  String? username;
  EnumUserStatus? status;
  String? email;
  String? name;
  String? shortDescription;

  CatalogUnitResponse? unit;
  CatalogDepartmentResponse? department;
  CatalogPositionResponse? position;

  UserResponse(
      {this.id,
      this.username,
      this.status,
      this.email,
      this.name,
      this.shortDescription,
      this.unit,
      this.department,
      this.position});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
