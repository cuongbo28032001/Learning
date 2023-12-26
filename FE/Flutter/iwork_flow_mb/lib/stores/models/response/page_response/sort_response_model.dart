class SortModel {
  bool? empty;
  bool? unsorted;
  bool? sorted;

  SortModel({this.empty, this.unsorted, this.sorted});

  SortModel.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    unsorted = json['unsorted'];
    sorted = json['sorted'];
  }
}
