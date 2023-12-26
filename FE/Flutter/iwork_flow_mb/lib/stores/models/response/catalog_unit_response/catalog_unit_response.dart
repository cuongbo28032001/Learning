import 'package:iwork_flow_mb/stores/models/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'catalog_unit_response.g.dart';

@JsonSerializable()
class CatalogUnitResponse {
  int? id;
  int? parentId;
  String? title;
  String? description;
  String? createdDate;
  UserResponse? createdBy;
  String? lastModifiedDate;
  UserResponse? lastModifiedBy;
  CatalogUnitResponse? parent;

  CatalogUnitResponse(
      {this.id,
      this.parentId,
      this.title,
      this.description,
      this.createdDate,
      this.createdBy,
      this.lastModifiedDate,
      this.lastModifiedBy,
      this.parent});

  factory CatalogUnitResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogUnitResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogUnitResponseToJson(this);
}
