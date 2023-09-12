class LeavesRequestResponse {
  LeavesRequestResponse({
    this.status,
    this.message,
  });

  LeavesRequestResponse.fromJson(dynamic json) {
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

  @override
  String toString() {
    return 'LeavesRequestResponse{status: $status, message: $message}';
  }
}
