import 'change_request_response.dart';

class ChangeRequestWrapperResponse {
  ChangeRequestWrapperResponse({
    this.response,
  });

  ChangeRequestWrapperResponse.fromJson(dynamic json) {
    response =
        json['response'] != null ? ChangeRequestResponse.fromJson(json['response']) : null;
  }

  ChangeRequestResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }
}
