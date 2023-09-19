import 'change_password_response.dart';

class ChangePasswordWrapperResponse {
  ChangePasswordWrapperResponse({
      this.response,});

  ChangePasswordWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null ? ChangePasswordResponse.fromJson(json['response']) : null;
  }
  ChangePasswordResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

}