import 'employee_response.dart';

class EmployeesDataResponse {
  EmployeesDataResponse({
    this.employee,
  });

  EmployeesDataResponse.fromJson(dynamic json) {
    employee = json['employee'] != null
        ? EmployeeResponse.fromJson(json['employee'])
        : null;
  }

  EmployeeResponse? employee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (employee != null) {
      map['employee'] = employee?.toJson();
    }
    return map;
  }
}
