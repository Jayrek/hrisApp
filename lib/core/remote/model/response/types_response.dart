class TypesResponse {
  TypesResponse({
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
    this.six,
  });

  TypesResponse.fromJson(dynamic json) {
    one = json['1'];
    two = json['2'];
    three = json['3'];
    four = json['4'];
    five = json['5'];
    six = json['6'];
  }

  String? one;
  String? two;
  String? three;
  String? four;
  String? five;
  String? six;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['1'] = one;
    map['2'] = two;
    map['3'] = three;
    map['4'] = four;
    map['5'] = five;
    map['6'] = six;
    return map;
  }
}
