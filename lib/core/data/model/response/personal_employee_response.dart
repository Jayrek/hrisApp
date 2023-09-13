class PersonalEmployeeResponse {
  PersonalEmployeeResponse({
    this.id,
    this.employeeId,
    this.bloodType,
    this.spouse,
    this.father,
    this.mother,
    this.mobile,
    this.phone,
    this.birthdate,
    this.nationality,
    this.gender,
    this.maritalStatus,
    this.brgyCode,
    this.citymunCode,
    this.provCode,
    this.regCode,
    this.sitio,
    this.address,
    this.emergency,
    this.relation,
    this.contactNo,
    this.sss,
    this.pagIbig,
    this.tin,
    this.domainEmail,
    this.personalEmail,
    this.facebook,
    this.bankAccount,
    this.fiveYearsTenure,
    this.dateIncrease,
    this.remarks,
    this.hris,
    this.vaccine,
    this.assignedHr,
    this.hmo,
    this.memberCode,
    this.otherHmo,
  });

  PersonalEmployeeResponse.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employee_id'];
    bloodType = json['blood_type'];
    spouse = json['spouse'];
    father = json['father'];
    mother = json['mother'];
    mobile = json['mobile'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    nationality = json['nationality'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    brgyCode = json['brgyCode'];
    citymunCode = json['citymunCode'];
    provCode = json['provCode'];
    regCode = json['regCode'];
    sitio = json['sitio'];
    address = json['address'];
    emergency = json['emergency'];
    relation = json['relation'];
    contactNo = json['contact_no'];
    sss = json['sss'];
    pagIbig = json['pag_ibig'];
    tin = json['tin'];
    domainEmail = json['domain_email'];
    personalEmail = json['personal_email'];
    facebook = json['facebook'];
    bankAccount = json['bank_account'];
    fiveYearsTenure = json['five_years_tenure'];
    dateIncrease = json['date_increase'];
    remarks = json['remarks'];
    hris = json['hris'];
    vaccine = json['vaccine'];
    assignedHr = json['assigned_hr'];
    hmo = json['hmo'];
    memberCode = json['member_code'];
    otherHmo = json['other_hmo'];
  }

  int? id;
  int? employeeId;
  String? bloodType;
  String? spouse;
  String? father;
  String? mother;
  String? mobile;
  String? phone;
  String? birthdate;
  String? nationality;
  String? gender;
  String? maritalStatus;
  String? brgyCode;
  String? citymunCode;
  String? provCode;
  String? regCode;
  String? sitio;
  String? address;
  String? emergency;
  String? relation;
  String? contactNo;
  String? sss;
  String? pagIbig;
  String? tin;
  String? domainEmail;
  String? personalEmail;
  String? facebook;
  String? bankAccount;
  String? fiveYearsTenure;
  String? dateIncrease;
  String? remarks;
  String? hris;
  String? vaccine;
  String? assignedHr;
  String? hmo;
  String? memberCode;
  String? otherHmo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_id'] = employeeId;
    map['blood_type'] = bloodType;
    map['spouse'] = spouse;
    map['father'] = father;
    map['mother'] = mother;
    map['mobile'] = mobile;
    map['phone'] = phone;
    map['birthdate'] = birthdate;
    map['nationality'] = nationality;
    map['gender'] = gender;
    map['marital_status'] = maritalStatus;
    map['brgyCode'] = brgyCode;
    map['citymunCode'] = citymunCode;
    map['provCode'] = provCode;
    map['regCode'] = regCode;
    map['sitio'] = sitio;
    map['address'] = address;
    map['emergency'] = emergency;
    map['relation'] = relation;
    map['contact_no'] = contactNo;
    map['sss'] = sss;
    map['pag_ibig'] = pagIbig;
    map['tin'] = tin;
    map['domain_email'] = domainEmail;
    map['personal_email'] = personalEmail;
    map['facebook'] = facebook;
    map['bank_account'] = bankAccount;
    map['five_years_tenure'] = fiveYearsTenure;
    map['date_increase'] = dateIncrease;
    map['remarks'] = remarks;
    map['hris'] = hris;
    map['vaccine'] = vaccine;
    map['assigned_hr'] = assignedHr;
    map['hmo'] = hmo;
    map['member_code'] = memberCode;
    map['other_hmo'] = otherHmo;
    return map;
  }

  @override
  String toString() {
    return 'PersonalEmployeeResponse{id: $id, employeeId: $employeeId, bloodType: $bloodType, spouse: $spouse, father: $father, mother: $mother, mobile: $mobile, phone: $phone, birthdate: $birthdate, nationality: $nationality, gender: $gender, maritalStatus: $maritalStatus, brgyCode: $brgyCode, citymunCode: $citymunCode, provCode: $provCode, regCode: $regCode, sitio: $sitio, address: $address, emergency: $emergency, relation: $relation, contactNo: $contactNo, sss: $sss, pagIbig: $pagIbig, tin: $tin, domainEmail: $domainEmail, personalEmail: $personalEmail, facebook: $facebook, bankAccount: $bankAccount, fiveYearsTenure: $fiveYearsTenure, dateIncrease: $dateIncrease, remarks: $remarks, hris: $hris, vaccine: $vaccine, assignedHr: $assignedHr, hmo: $hmo, memberCode: $memberCode, otherHmo: $otherHmo}';
  }
}
