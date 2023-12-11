import 'works_response.dart';

class WorksWrapperResponse {
  WorksWrapperResponse({
    this.response,
  });

  WorksWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null
        ? WorksResponse.fromJson(json['response'])
        : null;
  }

  WorksResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }
}
