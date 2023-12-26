import 'package:iwork_flow_mb/stores/models/response/page_response/sort_response_model.dart';

class PageableModel {
  SortModel? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? paged;
  bool? unpaged;

  PageableModel(
      {this.sort,
      this.offset,
      this.pageNumber,
      this.pageSize,
      this.paged,
      this.unpaged});

  factory PageableModel.fromJson(Map<String, dynamic> json) {
    return PageableModel(
      sort: (json['sort'] != null) ? SortModel.fromJson(json['sort']) : null,
      offset: json['offset'],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      paged: json['paged'],
      unpaged: json['unpaged'],
    );
  }
}
