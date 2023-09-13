class AttendanceInOutWrapperResponse {
  AttendanceInOutWrapperResponse({
    this.response,
  });

  AttendanceInOutWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null
        ? AttendanceInOutResponse.fromJson(json['response'])
        : null;
  }

  AttendanceInOutResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }
}

class AttendanceInOutResponse {
  AttendanceInOutResponse({
    this.status,
    this.message,
  });

  AttendanceInOutResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'] != null
        ? AttendanceInOutMessageResponse.fromJson(json['message'])
        : null;
  }

  String? status;
  AttendanceInOutMessageResponse? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (message != null) {
      map['message'] = message?.toJson();
    }
    return map;
  }
}

class AttendanceInOutMessageResponse {
  AttendanceInOutMessageResponse({
    this.msg,
  });

  AttendanceInOutMessageResponse.fromJson(dynamic json) {
    msg = json['msg'];
  }

  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    return map;
  }
}
