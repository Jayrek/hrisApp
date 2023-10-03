class StatusResponse {
  StatusResponse({
    this.approved,
    this.pending,
    this.rejeced,
  });

  StatusResponse.fromJson(dynamic json) {
    approved = json['Approved'];
    pending = json['Pending'];
    rejeced = json['Rejeced'];
  }

  String? approved;
  String? pending;
  String? rejeced;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Approved'] = approved;
    map['Pending'] = pending;
    map['Rejeced'] = rejeced;
    return map;
  }
}
