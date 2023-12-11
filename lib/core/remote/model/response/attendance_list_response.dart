class AttendanceListResponse {
  AttendanceListResponse({
    this.id,
    this.employeeId,
    this.workId,
    this.shift,
    this.campaign,
    this.amIn,
    this.amOut,
    this.pmIn,
    this.pmOut,
    this.otIn,
    this.otOut,
    this.added,
    this.late,
    this.noLate,
    this.overtime,
    this.noOver,
    this.undertime,
    this.noUnder,
    this.balTime,
    this.source,
    this.outSource,
    this.biometricid,
  });

  AttendanceListResponse.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employee_id'];
    workId = json['work_id'];
    shift = json['shift'];
    campaign = json['campaign'];
    amIn = json['am_in'];
    amOut = json['am_out'];
    pmIn = json['pm_in'];
    pmOut = json['pm_out'];
    otIn = json['ot_in'];
    otOut = json['ot_out'];
    added = json['added'];
    late = json['late'];
    noLate = json['no_late'];
    overtime = json['overtime'];
    noOver = json['no_over'];
    undertime = json['undertime'];
    noUnder = json['no_under'];
    balTime = json['bal_time'];
    source = json['source'];
    outSource = json['out_source'];
    biometricid = json['biometricid'];
  }

  int? id;
  int? employeeId;
  int? workId;
  String? shift;
  String? campaign;
  String? amIn;
  String? amOut;
  String? pmIn;
  String? pmOut;
  String? otIn;
  String? otOut;
  String? added;
  String? late;
  int? noLate;
  String? overtime;
  int? noOver;
  String? undertime;
  int? noUnder;
  String? balTime;
  String? source;
  String? outSource;
  String? biometricid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_id'] = employeeId;
    map['work_id'] = workId;
    map['shift'] = shift;
    map['campaign'] = campaign;
    map['am_in'] = amIn;
    map['am_out'] = amOut;
    map['pm_in'] = pmIn;
    map['pm_out'] = pmOut;
    map['ot_in'] = otIn;
    map['ot_out'] = otOut;
    map['added'] = added;
    map['late'] = late;
    map['no_late'] = noLate;
    map['overtime'] = overtime;
    map['no_over'] = noOver;
    map['undertime'] = undertime;
    map['no_under'] = noUnder;
    map['bal_time'] = balTime;
    map['source'] = source;
    map['out_source'] = outSource;
    map['biometricid'] = biometricid;
    return map;
  }

  @override
  String toString() {
    return 'AttendanceListResponse{id: $id, employeeId: $employeeId, workId: $workId, shift: $shift, campaign: $campaign, amIn: $amIn, amOut: $amOut, pmIn: $pmIn, pmOut: $pmOut, otIn: $otIn, otOut: $otOut, added: $added, late: $late, noLate: $noLate, overtime: $overtime, noOver: $noOver, undertime: $undertime, noUnder: $noUnder, balTime: $balTime, source: $source, outSource: $outSource, biometricid: $biometricid}';
  }
}
