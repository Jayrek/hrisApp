class PerformancesResponse {
  PerformancesResponse({
      this.id, 
      this.employeeId, 
      this.reviewDate, 
      this.reportingTo, 
      this.jobKnowledge, 
      this.workquality, 
      this.punctuality, 
      this.communication, 
      this.dependability, 
      this.comments,});

  PerformancesResponse.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employee_id'];
    reviewDate = json['review_date'];
    reportingTo = json['reporting_to'];
    jobKnowledge = json['job_knowledge'];
    workquality = json['workquality'];
    punctuality = json['punctuality'];
    communication = json['communication'];
    dependability = json['dependability'];
    comments = json['comments'];
  }
  int? id;
  int? employeeId;
  String? reviewDate;
  int? reportingTo;
  String? jobKnowledge;
  String? workquality;
  String? punctuality;
  String? communication;
  String? dependability;
  String? comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_id'] = employeeId;
    map['review_date'] = reviewDate;
    map['reporting_to'] = reportingTo;
    map['job_knowledge'] = jobKnowledge;
    map['workquality'] = workquality;
    map['punctuality'] = punctuality;
    map['communication'] = communication;
    map['dependability'] = dependability;
    map['comments'] = comments;
    return map;
  }

}