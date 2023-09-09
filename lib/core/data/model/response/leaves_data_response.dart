import 'leave_applications_response.dart';
import 'leaves_dropdown_options_response.dart';
import 'current_leave_credits_response.dart';
import 'statistics_response.dart';

class LeavesDataResponse {
  LeavesDataResponse({
    this.leaveApplications,
    this.dropdownOptions,
    this.currentLeaveCredits,
    this.statistics,
  });

  LeavesDataResponse.fromJson(dynamic json) {
    if (json['leaveApplications'] != null) {
      leaveApplications = [];
      json['leaveApplications'].forEach((v) {
        leaveApplications?.add(LeaveApplications.fromJson(v));
      });
    }
    dropdownOptions = json['dropdownOptions'] != null
        ? DropdownOptions.fromJson(json['dropdownOptions'])
        : null;
    currentLeaveCredits = json['currentLeaveCredits'] != null
        ? CurrentLeaveCreditsResponse.fromJson(json['currentLeaveCredits'])
        : null;
    statistics = json['statistics'] != null
        ? StatisticsResponse.fromJson(json['statistics'])
        : null;
  }

  List<LeaveApplications>? leaveApplications;
  DropdownOptions? dropdownOptions;
  CurrentLeaveCreditsResponse? currentLeaveCredits;
  StatisticsResponse? statistics;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (leaveApplications != null) {
      map['leaveApplications'] =
          leaveApplications?.map((v) => v.toJson()).toList();
    }
    if (dropdownOptions != null) {
      map['dropdownOptions'] = dropdownOptions?.toJson();
    }
    if (currentLeaveCredits != null) {
      map['currentLeaveCredits'] = currentLeaveCredits?.toJson();
    }
    if (statistics != null) {
      map['statistics'] = statistics?.toJson();
    }
    return map;
  }
}
