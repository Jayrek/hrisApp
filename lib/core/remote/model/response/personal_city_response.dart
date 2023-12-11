class PersonalCityResponse {
  PersonalCityResponse({
    this.id,
    this.psgcCode,
    this.citymunDesc,
    this.regDesc,
    this.provCode,
    this.citymunCode,
  });

  PersonalCityResponse.fromJson(dynamic json) {
    id = json['id'];
    psgcCode = json['psgcCode'];
    citymunDesc = json['citymunDesc'];
    regDesc = json['regDesc'];
    provCode = json['provCode'];
    citymunCode = json['citymunCode'];
  }

  int? id;
  String? psgcCode;
  String? citymunDesc;
  String? regDesc;
  String? provCode;
  String? citymunCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['psgcCode'] = psgcCode;
    map['citymunDesc'] = citymunDesc;
    map['regDesc'] = regDesc;
    map['provCode'] = provCode;
    map['citymunCode'] = citymunCode;
    return map;
  }

  @override
  String toString() {
    return 'PersonalCityResponse{id: $id, psgcCode: $psgcCode, citymunDesc: $citymunDesc, regDesc: $regDesc, provCode: $provCode, citymunCode: $citymunCode}';
  }
}
