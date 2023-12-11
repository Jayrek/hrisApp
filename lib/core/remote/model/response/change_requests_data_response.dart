import 'change_requests_response.dart';

class ChangeRequestsDataResponse {
  ChangeRequestsDataResponse({
    this.changerequests,
  });

  ChangeRequestsDataResponse.fromJson(dynamic json) {
    if (json['changerequests'] != null) {
      changerequests = [];
      json['changerequests'].forEach((v) {
        changerequests?.add(ChangeRequestResponse.fromJson(v));
      });
    }
  }

  List<ChangeRequestResponse>? changerequests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (changerequests != null) {
      map['changerequests'] = changerequests?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
