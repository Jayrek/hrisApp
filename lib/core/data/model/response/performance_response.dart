import 'performance_data_response.dart';

class PerformanceResponse {
  PerformanceResponse({
      this.status, 
      this.message, 
      this.data,});

  PerformanceResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PerformanceDataResponse.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  PerformanceDataResponse? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}