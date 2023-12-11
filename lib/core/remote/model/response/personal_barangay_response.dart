class PersonalBarangayResponse {
  PersonalBarangayResponse({
    this.id,
    this.brgyCode,
    this.brgyDesc,
    this.regCode,
    this.provCode,
    this.citymunCode,
  });

  PersonalBarangayResponse.fromJson(dynamic json) {
    id = json['id'];
    brgyCode = json['brgyCode'];
    brgyDesc = json['brgyDesc'];
    regCode = json['regCode'];
    provCode = json['provCode'];
    citymunCode = json['citymunCode'];
  }

  int? id;
  String? brgyCode;
  String? brgyDesc;
  String? regCode;
  String? provCode;
  String? citymunCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brgyCode'] = brgyCode;
    map['brgyDesc'] = brgyDesc;
    map['regCode'] = regCode;
    map['provCode'] = provCode;
    map['citymunCode'] = citymunCode;
    return map;
  }

  @override
  String toString() {
    return 'PersonalBarangayResponse{id: $id, brgyCode: $brgyCode, brgyDesc: $brgyDesc, regCode: $regCode, provCode: $provCode, citymunCode: $citymunCode}';
  }
}
