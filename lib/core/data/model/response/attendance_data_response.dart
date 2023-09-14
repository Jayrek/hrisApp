import 'package:rgs_hris/core/data/model/response/attendance_work_response.dart';

import 'attendance_params_response.dart';
import 'attendance_list_response.dart';

class AttendanceDataResponse {
  AttendanceDataResponse({
    this.params,
    this.attendances,
    this.attendanceWorkResponse,
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
    attendanceWorkResponse = json['work'] != null
        ? AttendanceWorkResponse.fromJson(json['work'])
        : null;
  }

  AttendanceParamsResponse? params;
  List<AttendanceListResponse>? attendances;
  AttendanceWorkResponse? attendanceWorkResponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (params != null) {
      map['params'] = params?.toJson();
    }
    if (attendances != null) {
      map['attendances'] = attendances?.map((v) => v.toJson()).toList();
    }
    if (attendanceWorkResponse != null) {
      map['work'] = attendanceWorkResponse?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'AttendanceDataResponse{params: $params, attendances: $attendances, attendanceWorkResponse: $attendanceWorkResponse}';
  }
}
