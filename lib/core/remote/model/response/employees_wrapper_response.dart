import 'employees_response.dart';

class EmployeesWrapperResponse {
  EmployeesWrapperResponse({
    this.response,
  });

  EmployeesWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null
        ? EmployeesResponse.fromJson(json['response'])
        : null;
  }

  EmployeesResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }
}
