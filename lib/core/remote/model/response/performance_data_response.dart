import 'performances_response.dart';

class PerformanceDataResponse {
  PerformanceDataResponse({
    this.performances,
  });

  PerformanceDataResponse.fromJson(dynamic json) {
    if (json['performances'] != null) {
      performances = [];
      json['performances'].forEach((v) {
        performances?.add(PerformancesResponse.fromJson(v));
      });
    }
  }

  List<PerformancesResponse>? performances;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (performances != null) {
      map['performances'] = performances?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
