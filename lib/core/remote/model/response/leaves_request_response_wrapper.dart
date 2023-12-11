import 'leaves_request_response.dart';

class LeavesRequestResponseWrapper {
  LeavesRequestResponseWrapper({
    this.response,
  });

  LeavesRequestResponseWrapper.fromJson(dynamic json) {
    response = json['response'] != null
        ? LeavesRequestResponse.fromJson(json['response'])
        : null;
  }

  LeavesRequestResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'LeavesRequestResponseWrapper{response: $response}';
  }
}
