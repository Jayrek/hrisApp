class EmployeesLeaveCreditsResponse {
  EmployeesLeaveCreditsResponse({
    this.id,
    this.employeeId,
    this.sl,
    this.vl,
    this.spl,
    this.pl,
    this.ml,
    this.bl,
    this.year,
    this.added,
    this.status,
  });

  EmployeesLeaveCreditsResponse.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employee_id'];
    sl = json['sl'];
    vl = json['vl'];
    spl = json['spl'];
    pl = json['pl'];
    ml = json['ml'];
    bl = json['bl'];
    year = json['year'];
    added = json['added'];
    status = json['status'];
  }

  int? id;
  int? employeeId;
  String? sl;
  String? vl;
  String? spl;
  String? pl;
  String? ml;
  String? bl;
  String? year;
  String? added;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_id'] = employeeId;
    map['sl'] = sl;
    map['vl'] = vl;
    map['spl'] = spl;
    map['pl'] = pl;
    map['ml'] = ml;
    map['bl'] = bl;
    map['year'] = year;
    map['added'] = added;
    map['status'] = status;
    return map;
  }
}
