import 'performance_response.dart';

class PerformanceWrapperResponse {
  PerformanceWrapperResponse({
      this.response,});

  PerformanceWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null ? PerformanceResponse.fromJson(json['response']) : null;
  }
  PerformanceResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

}