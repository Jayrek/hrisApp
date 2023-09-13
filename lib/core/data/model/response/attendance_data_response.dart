import 'attendance_params_response.dart';
import 'attendance_list_response.dart';

class AttendanceDataResponse {
  AttendanceDataResponse({
    this.params,
    this.attendances,
  });

  AttendanceDataResponse.fromJson(dynamic json) {
    params = json['params'] != null
        ? AttendanceParamsResponse.fromJson(json['params'])
        : null;
    if (json['attendances'] != null) {
      attendances = [];
      json['attendances'].forEach((v) {
        attendances?.add(AttendanceListResponse.fromJson(v));
      });
    }
  }

  AttendanceParamsResponse? params;
  List<AttendanceListResponse>? attendances;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (params != null) {
      map['params'] = params?.toJson();
    }
    if (attendances != null) {
      map['attendances'] = attendances?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'AttendanceDataResponse{params: $params, attendances: $attendances}';
  }
}
