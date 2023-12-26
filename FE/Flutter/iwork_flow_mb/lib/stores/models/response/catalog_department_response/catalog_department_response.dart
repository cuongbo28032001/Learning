import 'package:iwork_flow_mb/stores/models/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'catalog_department_response.g.dart';

@JsonSerializable()
class CatalogDepartmentResponse {
  int? id;
  String? title;
  String? description;
  String? createdDate;
  UserResponse? createdBy;
  String? lastModifiedDate;
  UserResponse? lastModifiedBy;

  CatalogDepartmentResponse(
      {this.id,
      this.title,
      this.description,
      this.createdDate,
      this.createdBy,
      this.lastModifiedDate,
      this.lastModifiedBy});

  factory CatalogDepartmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogDepartmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogDepartmentResponseToJson(this);
}
