import 'personal_data_response.dart';

class PersonalResponse {
  PersonalResponse({
    this.status,
    this.message,
    this.data,
  });

  PersonalResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? PersonalDataResponse.fromJson(json['data'])
        : null;
  }

  String? status;
  String? message;
  PersonalDataResponse? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'PersonalResponse{status: $status, message: $message, data: $data}';
  }
}
