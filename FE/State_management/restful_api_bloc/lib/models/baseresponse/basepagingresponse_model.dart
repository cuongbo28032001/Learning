class BasePagingResponse<T> {
  final String? errorCode;
  final String? errorMessage;
  final PageResponse<T>? data;
  const BasePagingResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });
  factory BasePagingResponse.fromJson(Map<String, dynamic> json) {
    return BasePagingResponse(
      errorCode: json['errorCode'],
      errorMessage: json['errorMessage'],
      data: (json['data'] != null) ? PageResponse.fromJson(json['data']) : null,
    );
  }
}

class PageResponse<T> {
  final bool first;
  final bool last;
  final int? totalPages;
  final int? totalElements;
  final int? size;
  final int? number;
  final int? numberOfElements;
  final List? content;
  const PageResponse({
    this.totalPages,
    this.totalElements,
    this.size,
    this.number,
    this.numberOfElements,
    this.content,
    this.first = false,
    this.last = false,
  });
  factory PageResponse.fromJson(Map<String, dynamic> json) {
    return PageResponse(
      first: json['first'],
      last: json['last'],
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      size: json['size'],
      number: json['number'],
      numberOfElements: json['numberOfElements'],
      content: json['content'],
    );
  }
}
