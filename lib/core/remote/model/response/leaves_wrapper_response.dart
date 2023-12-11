import 'leaves_response.dart';

class LeavesWrapperResponse {
  LeavesWrapperResponse({
    this.leavesResponse,
  });

  LeavesWrapperResponse.fromJson(dynamic json) {
    leavesResponse = json['response'] != null
        ? LeavesResponse.fromJson(json['response'])
        : null;
  }

  LeavesResponse? leavesResponse;

  static LeavesWrapperResponse emptyValue =
      LeavesWrapperResponse(leavesResponse: null);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (leavesResponse != null) {
      map['response'] = leavesResponse?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'LeavesWrapperResponse{leavesResponse: $leavesResponse}';
  }
}
