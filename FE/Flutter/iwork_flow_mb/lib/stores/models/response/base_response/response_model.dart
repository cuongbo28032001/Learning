class BaseResponse<T> {
  T? body;
  BaseResponse({this.body});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      body: json['body'],
    );
  }
}
