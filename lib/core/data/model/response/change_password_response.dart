class ChangePasswordResponse {
  ChangePasswordResponse({
    this.status,
    this.message,
  });

  ChangePasswordResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }

  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
