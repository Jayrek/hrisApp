class WorksEmployeeResponse {
  WorksEmployeeResponse({
    this.id,
    this.refid,
    this.name,
    this.fname,
    this.mname,
    this.lname,
    this.empid,
    this.email,
    this.mobile,
    this.type,
    this.status,
    this.dateHired,
    this.pic,
    this.leaveCredits,
    this.biometricid,
    this.officeBranch,
    this.sixthMonth,
    this.tenureship,
    this.positionSector,
    this.teamLeader,
    this.omBmTm,
    this.areaGrouping,
  });

  WorksEmployeeResponse.fromJson(dynamic json) {
    id = json['id'];
    refid = json['refid'];
    name = json['name'];
    fname = json['fname'];
    mname = json['mname'];
    lname = json['lname'];
    empid = json['empid'];
    email = json['email'];
    mobile = json['mobile'];
    type = json['type'];
    status = json['status'];
    dateHired = json['date_hired'];
    pic = json['pic'];
    leaveCredits = json['leave_credits'];
    biometricid = json['biometricid'];
    officeBranch = json['office_branch'];
    sixthMonth = json['sixth_month'];
    tenureship = json['tenureship'];
    positionSector = json['position_sector'];
    teamLeader = json['team_leader'];
    omBmTm = json['om_bm_tm'];
    areaGrouping = json['area_grouping'];
  }

  int? id;
  String? refid;
  String? name;
  String? fname;
  String? mname;
  String? lname;
  String? empid;
  String? email;
  String? mobile;
  String? type;
  String? status;
  String? dateHired;
  String? pic;
  int? leaveCredits;
  String? biometricid;
  String? officeBranch;
  String? sixthMonth;
  String? tenureship;
  String? positionSector;
  String? teamLeader;
  String? omBmTm;
  String? areaGrouping;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['refid'] = refid;
    map['name'] = name;
    map['fname'] = fname;
    map['mname'] = mname;
    map['lname'] = lname;
    map['empid'] = empid;
    map['email'] = email;
    map['mobile'] = mobile;
    map['type'] = type;
    map['status'] = status;
    map['date_hired'] = dateHired;
    map['pic'] = pic;
    map['leave_credits'] = leaveCredits;
    map['biometricid'] = biometricid;
    map['office_branch'] = officeBranch;
    map['sixth_month'] = sixthMonth;
    map['tenureship'] = tenureship;
    map['position_sector'] = positionSector;
    map['team_leader'] = teamLeader;
    map['om_bm_tm'] = omBmTm;
    map['area_grouping'] = areaGrouping;
    return map;
  }
}
