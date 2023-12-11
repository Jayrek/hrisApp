class WorksHireSourceResponse {
  WorksHireSourceResponse({
    this.direct,
    this.newspaper,
    this.internet,
    this.friend,
  });

  WorksHireSourceResponse.fromJson(dynamic json) {
    direct = json['Direct'];
    newspaper = json['Newspaper'];
    internet = json['Internet'];
    friend = json['Friend'];
  }

  String? direct;
  String? newspaper;
  String? internet;
  String? friend;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Direct'] = direct;
    map['Newspaper'] = newspaper;
    map['Internet'] = internet;
    map['Friend'] = friend;
    return map;
  }
}
