import 'works_data_response.dart';

class WorksResponse {
  WorksResponse({
      this.status, 
      this.message, 
      this.data,});

  WorksResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? WorksDataResponse.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  WorksDataResponse? data;

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