import 'wrapper_response.dart';

class WrapperDefaultResponse {
  WrapperDefaultResponse({
      this.response,});

  WrapperDefaultResponse.fromJson(dynamic json) {
    response = json['response'] != null ? WrapperResponse.fromJson(json['response']) : null;
  }
  WrapperResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

}