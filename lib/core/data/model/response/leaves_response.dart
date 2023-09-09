import 'leaves_data_response.dart';

class LeavesResponse {
  LeavesResponse({
    this.data,
  });

  LeavesResponse.fromJson(dynamic json) {
    data =
        json['data'] != null ? LeavesDataResponse.fromJson(json['data']) : null;
  }

  LeavesDataResponse? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
