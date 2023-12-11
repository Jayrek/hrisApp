class AttendanceShiftResponse {
  AttendanceShiftResponse({
    this.id,
    this.name,
    this.shiftId,
    this.amIn,
    this.amOut,
    this.pmIn,
    this.pmOut,
    this.otIn,
    this.otOut,
  });

  AttendanceShiftResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    shiftId = json['shift_id'];
    amIn = json['am_in'];
    amOut = json['am_out'];
    pmIn = json['pm_in'];
    pmOut = json['pm_out'];
    otIn = json['ot_in'];
    otOut = json['ot_out'];
  }

  int? id;
  String? name;
  int? shiftId;
  String? amIn;
  String? amOut;
  String? pmIn;
  String? pmOut;
  String? otIn;
  String? otOut;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['shift_id'] = shiftId;
    map['am_in'] = amIn;
    map['am_out'] = amOut;
    map['pm_in'] = pmIn;
    map['pm_out'] = pmOut;
    map['ot_in'] = otIn;
    map['ot_out'] = otOut;
    return map;
  }

  @override
  String toString() {
    return 'AttendanceShiftResponse{id: $id, name: $name, shiftId: $shiftId, amIn: $amIn, amOut: $amOut, pmIn: $pmIn, pmOut: $pmOut, otIn: $otIn, otOut: $otOut}';
  }
}
