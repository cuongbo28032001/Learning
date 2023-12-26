import 'package:iwork_flow_mb/stores/models/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'catalog_position_response.g.dart';

@JsonSerializable()
class CatalogPositionResponse {
  int? id;
  String? title;
  String? description;
  String? createdDate;
  UserResponse? createdBy;
  String? lastModifiedDate;
  UserResponse? lastModifiedBy;

  CatalogPositionResponse(
      {this.id,
      this.title,
      this.description,
      this.createdDate,
      this.createdBy,
      this.lastModifiedDate,
      this.lastModifiedBy});

  factory CatalogPositionResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogPositionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogPositionResponseToJson(this);
}
