import 'package:json_annotation/json_annotation.dart';
part 'folder_response.g.dart';

@JsonSerializable()
class FolderResponse {
  int? id;
  String? code;
  String? title;
  String? description;
  int? spaceId;
  int? parentId;

  FolderResponse(
      {this.id,
      this.code,
      this.title,
      this.description,
      this.spaceId,
      this.parentId});

  factory FolderResponse.fromJson(Map<String, dynamic> json) =>
      _$FolderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FolderResponseToJson(this);
}
