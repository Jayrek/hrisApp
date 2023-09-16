import 'my_access_response.dart';

class MyAccessWrapperResponse {
  MyAccessWrapperResponse({
    this.response,
  });

  MyAccessWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null
        ? MyAccessResponse.fromJson(json['response'])
        : null;
  }

  MyAccessResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }
}
