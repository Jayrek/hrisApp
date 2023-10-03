class PersonalProvinceResponse {
  PersonalProvinceResponse({
    this.id,
    this.psgcCode,
    this.provDesc,
    this.regCode,
    this.provCode,
  });

  PersonalProvinceResponse.fromJson(dynamic json) {
    id = json['id'];
    psgcCode = json['psgcCode'];
    provDesc = json['provDesc'];
    regCode = json['regCode'];
    provCode = json['provCode'];
  }

  int? id;
  String? psgcCode;
  String? provDesc;
  String? regCode;
  String? provCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['psgcCode'] = psgcCode;
    map['provDesc'] = provDesc;
    map['regCode'] = regCode;
    map['provCode'] = provCode;
    return map;
  }

  @override
  String toString() {
    return 'PersonalProvinceResponse{id: $id, psgcCode: $psgcCode, provDesc: $provDesc, regCode: $regCode, provCode: $provCode}';
  }
}
