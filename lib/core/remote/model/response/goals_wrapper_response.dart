import 'goal_response.dart';

class GoalsWrapperResponse {
  GoalsWrapperResponse({
    this.response,
  });

  GoalsWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null
        ? GoalResponse.fromJson(json['response'])
        : null;
  }

  GoalResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }
}
