import 'package:iwork_flow_mb/stores/models/response/page_response/page_response_model.dart';
import 'package:iwork_flow_mb/stores/models/response/page_response/sort_response_model.dart';

class BaseResponsePaging<T> {
  List<T>? content;
  PageableModel? pageable;
  int? totalElements;
  int? totalPages;
  bool? last;
  int? size;
  int? number;
  SortModel? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  BaseResponsePaging(
      {this.content,
      this.pageable,
      this.totalElements,
      this.totalPages,
      this.last,
      this.size,
      this.number,
      this.sort,
      this.numberOfElements,
      this.first,
      this.empty});

  factory BaseResponsePaging.fromJson(Map<String, dynamic> json) {
    return BaseResponsePaging(
      content: json['content'],
      pageable: (json['pageable'] != null)
          ? PageableModel.fromJson(json['pageable'])
          : null,
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      last: json['last'],
      size: json['size'],
      number: json['number'],
      sort: json['sort'] != null ? SortModel.fromJson(json['sort']) : null,
      numberOfElements: json['numberOfElements'],
      first: json['first'],
      empty: json['empty'],
    );
  }
}
