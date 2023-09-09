class StatisticsResponse {
  StatisticsResponse({
    this.sl,
    this.vl,
    this.spl,
    this.pl,
    this.ml,
    this.bl,
  });

  StatisticsResponse.fromJson(dynamic json) {
    sl = json['sl'];
    vl = json['vl'];
    spl = json['spl'];
    pl = json['pl'];
    ml = json['ml'];
    bl = json['bl'];
  }

  String? sl;
  String? vl;
  String? spl;
  String? pl;
  String? ml;
  String? bl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sl'] = sl;
    map['vl'] = vl;
    map['spl'] = spl;
    map['pl'] = pl;
    map['ml'] = ml;
    map['bl'] = bl;
    return map;
  }
}
