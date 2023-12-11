import 'change_requests_data_response.dart';

class ChangeRequestResponse {
  ChangeRequestResponse({
    this.status,
    this.message,
    this.data,
  });

  ChangeRequestResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? ChangeRequestsDataResponse.fromJson(json['data'])
        : null;
  }

  String? status;
  String? message;
  ChangeRequestsDataResponse? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
