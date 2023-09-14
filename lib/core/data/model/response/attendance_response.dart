import 'attendance_data_response.dart';

class AttendanceResponse {
  AttendanceResponse({
      this.status, 
      this.message, 
      this.data,});

  AttendanceResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? AttendanceDataResponse.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  AttendanceDataResponse? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'AttendanceResponse{status: $status, message: $message, data: $data}';
  }
}