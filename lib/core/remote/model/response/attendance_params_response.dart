class AttendanceParamsResponse {
  AttendanceParamsResponse({
      this.from, 
      this.to,});

  AttendanceParamsResponse.fromJson(dynamic json) {
    from = json['from'];
    to = json['to'];
  }
  String? from;
  String? to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = from;
    map['to'] = to;
    return map;
  }

  @override
  String toString() {
    return 'AttendanceParamsResponse{from: $from, to: $to}';
  }
}