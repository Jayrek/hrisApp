class LeaveApplications {
  LeaveApplications({
    this.id,
    this.type,
    this.employeeId,
    this.dateFiled,
    this.dateFrom,
    this.dateTo,
    this.noDays,
    this.description,
    this.status,
    this.approvedBy,
    this.rejectedBy,
    this.statusDate,
  });

  LeaveApplications.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    employeeId = json['employee_id'];
    dateFiled = json['date_filed'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    noDays = json['no_days'];
    description = json['description'];
    status = json['status'];
    approvedBy = json['approved_by'];
    rejectedBy = json['rejected_by'];
    statusDate = json['status_date'];
  }

  int? id;
  int? type;
  int? employeeId;
  String? dateFiled;
  String? dateFrom;
  String? dateTo;
  int? noDays;
  String? description;
  String? status;
  int? approvedBy;
  int? rejectedBy;
  String? statusDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['employee_id'] = employeeId;
    map['date_filed'] = dateFiled;
    map['date_from'] = dateFrom;
    map['date_to'] = dateTo;
    map['no_days'] = noDays;
    map['description'] = description;
    map['status'] = status;
    map['approved_by'] = approvedBy;
    map['rejected_by'] = rejectedBy;
    map['status_date'] = statusDate;
    return map;
  }

  @override
  String toString() {
    return 'LeaveApplications{id: $id, type: $type, employeeId: $employeeId, dateFiled: $dateFiled, dateFrom: $dateFrom, dateTo: $dateTo, noDays: $noDays, description: $description, status: $status, approvedBy: $approvedBy, rejectedBy: $rejectedBy, statusDate: $statusDate}';
  }
}
