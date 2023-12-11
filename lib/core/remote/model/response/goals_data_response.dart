import 'goals_response.dart';

class GoalsDataResponse {
  GoalsDataResponse({
    this.goals,
  });

  GoalsDataResponse.fromJson(dynamic json) {
    if (json['goals'] != null) {
      goals = [];
      json['goals'].forEach((v) {
        goals?.add(GoalsResponse.fromJson(v));
      });
    }
  }

  List<GoalsResponse>? goals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (goals != null) {
      map['goals'] = goals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
