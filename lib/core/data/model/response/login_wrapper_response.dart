import 'package:rgs_hris/core/data/model/response/login_response.dart';

class LoginWrapperResponse {
  LoginWrapperResponse({
    this.loginResponse,
  });

  LoginWrapperResponse.fromJson(dynamic json) {
    loginResponse = json['response'] != null
        ? LoginResponse.fromJson(json['response'])
        : null;
  }

  LoginResponse? loginResponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (loginResponse != null) {
      map['response'] = loginResponse?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'LoginWrapperResponse{response: $loginResponse}';
  }
}
