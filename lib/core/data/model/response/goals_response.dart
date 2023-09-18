class GoalsResponse {
  GoalsResponse({
    this.id,
    this.employeeId,
    this.setDate,
    this.completionDate,
    this.goalDescription,
    this.empAssessment,
    this.supervisor,
    this.supAssessment,
  });

  GoalsResponse.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employee_id'];
    setDate = json['set_date'];
    completionDate = json['completion_date'];
    goalDescription = json['goal_description'];
    empAssessment = json['emp_assessment'];
    supervisor = json['supervisor'];
    supAssessment = json['sup_assessment'];
  }

  int? id;
  int? employeeId;
  String? setDate;
  String? completionDate;
  String? goalDescription;
  String? empAssessment;
  int? supervisor;
  String? supAssessment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_id'] = employeeId;
    map['set_date'] = setDate;
    map['completion_date'] = completionDate;
    map['goal_description'] = goalDescription;
    map['emp_assessment'] = empAssessment;
    map['supervisor'] = supervisor;
    map['sup_assessment'] = supAssessment;
    return map;
  }
}
