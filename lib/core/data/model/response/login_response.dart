import 'package:rgs_hris/core/data/model/response/login_data_response.dart';

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.loginDataResponse,
  });

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    loginDataResponse =
        json['data'] != null ? LoginDataResponse.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  LoginDataResponse? loginDataResponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (loginDataResponse != null) {
      map['data'] = loginDataResponse?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'LoginResponse{status: $status, message: $message, loginDataResponse: $loginDataResponse}';
  }
}
