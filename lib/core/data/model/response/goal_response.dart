import 'goals_data_response.dart';

class GoalResponse {
  GoalResponse({
      this.status, 
      this.message, 
      this.data,});

  GoalResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? GoalsDataResponse.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  GoalsDataResponse? data;

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