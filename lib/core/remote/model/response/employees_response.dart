import 'employees_data_response.dart';

class EmployeesResponse {
  EmployeesResponse({
    this.status,
    this.message,
    this.data,
  });

  EmployeesResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? EmployeesDataResponse.fromJson(json['data'])
        : null;
  }

  String? status;
  String? message;
  EmployeesDataResponse? data;

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
