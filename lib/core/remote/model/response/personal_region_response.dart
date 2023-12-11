class PersonalRegionResponse {
  PersonalRegionResponse({
    this.id,
    this.psgcCode,
    this.regDesc,
    this.regCode,
  });

  PersonalRegionResponse.fromJson(dynamic json) {
    id = json['id'];
    psgcCode = json['psgcCode'];
    regDesc = json['regDesc'];
    regCode = json['regCode'];
  }

  int? id;
  String? psgcCode;
  String? regDesc;
  String? regCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['psgcCode'] = psgcCode;
    map['regDesc'] = regDesc;
    map['regCode'] = regCode;
    return map;
  }

  @override
  String toString() {
    return 'PersonalRegionResponse{id: $id, psgcCode: $psgcCode, regDesc: $regDesc, regCode: $regCode}';
  }
}
