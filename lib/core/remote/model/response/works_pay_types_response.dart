class WorksPayTypesResponse {
  WorksPayTypesResponse({
    this.hourly,
    this.daily,
    this.weekly,
    this.nthoftheMonth,
    this.monthly,
  });

  WorksPayTypesResponse.fromJson(dynamic json) {
    hourly = json['Hourly'];
    daily = json['Daily'];
    weekly = json['Weekly'];
    nthoftheMonth = json['nth of the Month'];
    monthly = json['Monthly'];
  }

  String? hourly;
  String? daily;
  String? weekly;
  String? nthoftheMonth;
  String? monthly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Hourly'] = hourly;
    map['Daily'] = daily;
    map['Weekly'] = weekly;
    map['nth of the Month'] = nthoftheMonth;
    map['Monthly'] = monthly;
    return map;
  }
}
