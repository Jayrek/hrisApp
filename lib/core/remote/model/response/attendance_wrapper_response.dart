import 'attendance_response.dart';

class AttendanceWrapperResponse {
  AttendanceWrapperResponse({
    this.response,
  });

  AttendanceWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null
        ? AttendanceResponse.fromJson(json['response'])
        : null;
  }

  AttendanceResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'AttendanceWrapperResponse{response: $response}';
  }
}
