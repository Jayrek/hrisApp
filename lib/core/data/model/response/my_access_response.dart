import 'my_access_data_response.dart';

class MyAccessResponse {
  MyAccessResponse({
      this.status, 
      this.message, 
      this.data,});

  MyAccessResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MyAccessResponseData.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  MyAccessResponseData? data;

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