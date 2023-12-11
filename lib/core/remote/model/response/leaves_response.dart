import 'leaves_data_response.dart';

class LeavesResponse {
  LeavesResponse({
    this.status,
    this.message,
    this.leavesDataResponse,
  });

  LeavesResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    leavesDataResponse =
        json['data'] != null ? LeavesDataResponse.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  LeavesDataResponse? leavesDataResponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (leavesDataResponse != null) {
      map['data'] = leavesDataResponse?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'LeavesResponse{status: $status, message: $message, leavesDataResponse: $leavesDataResponse}';
  }
}
