class ChangeRequestResponse {
  ChangeRequestResponse({
    this.id,
    this.employeeId,
    this.category,
    this.oldData,
    this.newData,
    this.added,
    this.status,
    this.updated,
    this.comment,
  });

  ChangeRequestResponse.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employee_id'];
    category = json['category'];
    oldData = json['old_data'];
    newData = json['new_data'];
    added = json['added'];
    status = json['status'];
    updated = json['updated'];
    comment = json['comment'];
  }

  int? id;
  int? employeeId;
  String? category;
  String? oldData;
  String? newData;
  String? added;
  String? status;
  String? updated;
  String? comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_id'] = employeeId;
    map['category'] = category;
    map['old_data'] = oldData;
    map['new_data'] = newData;
    map['added'] = added;
    map['status'] = status;
    map['updated'] = updated;
    map['comment'] = comment;
    return map;
  }
}
