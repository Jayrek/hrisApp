import 'personal_response.dart';

class PersonalWrapperResponse {
  PersonalWrapperResponse({
    this.response,
  });

  PersonalWrapperResponse.fromJson(dynamic json) {
    response =
        json['response'] != null ? PersonalResponse.fromJson(json['response']) : null;
  }

  PersonalResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'PersonalWrapperResponse{response: $response}';
  }
}
