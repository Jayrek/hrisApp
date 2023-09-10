import 'account_details_response.dart';
import 'employee_details_response.dart';

class LoginDataResponse {
  LoginDataResponse({
    this.token,
    this.accountDetails,
    this.employeeDetails,
  });

  LoginDataResponse.fromJson(dynamic json) {
    token = json['token'];
    accountDetails = json['account_details'] != null
        ? AccountDetailsResponse.fromJson(json['account_details'])
        : null;
    employeeDetails = json['employee_details'] != null
        ? EmployeeDetailsResponse.fromJson(json['employee_details'])
        : null;
  }

  String? token;
  AccountDetailsResponse? accountDetails;
  EmployeeDetailsResponse? employeeDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (accountDetails != null) {
      map['account_details'] = accountDetails?.toJson();
    }
    if (employeeDetails != null) {
      map['employee_details'] = employeeDetails?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'LoginResponse{token: $token, accountDetails: $accountDetails, employeeDetails: $employeeDetails}';
  }
}
