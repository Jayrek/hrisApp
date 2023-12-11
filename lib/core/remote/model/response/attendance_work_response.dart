import 'attendance_shift_response.dart';

class AttendanceWorkResponse {
  AttendanceWorkResponse({
    this.id,
    this.branchId,
    this.employeeId,
    this.shiftId,
    this.workdays,
    this.departmentId,
    this.designationId,
    this.jobId,
    this.locationId,
    this.reportingTo,
    this.sourceHire,
    this.payRate,
    this.allowance,
    this.payType,
    this.workPhone,
    this.officeStatus,
    this.shift,
  });

  AttendanceWorkResponse.fromJson(dynamic json) {
    id = json['id'];
    branchId = json['branch_id'];
    employeeId = json['employee_id'];
    shiftId = json['shift_id'];
    workdays = json['workdays'];
    departmentId = json['department_id'];
    designationId = json['designation_id'];
    jobId = json['job_id'];
    locationId = json['location_id'];
    reportingTo = json['reporting_to'];
    sourceHire = json['source_hire'];
    payRate = json['pay_rate'];
    allowance = json['allowance'];
    payType = json['pay_type'];
    workPhone = json['work_phone'];
    officeStatus = json['office_status'];
    shift = json['shift'] != null
        ? AttendanceShiftResponse.fromJson(json['shift'])
        : null;
  }

  int? id;
  int? branchId;
  int? employeeId;
  int? shiftId;
  String? workdays;
  int? departmentId;
  int? designationId;
  int? jobId;
  int? locationId;
  String? reportingTo;
  String? sourceHire;
  String? payRate;
  String? allowance;
  String? payType;
  String? workPhone;
  String? officeStatus;
  AttendanceShiftResponse? shift;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['branch_id'] = branchId;
    map['employee_id'] = employeeId;
    map['shift_id'] = shiftId;
    map['workdays'] = workdays;
    map['department_id'] = departmentId;
    map['designation_id'] = designationId;
    map['job_id'] = jobId;
    map['location_id'] = locationId;
    map['reporting_to'] = reportingTo;
    map['source_hire'] = sourceHire;
    map['pay_rate'] = payRate;
    map['allowance'] = allowance;
    map['pay_type'] = payType;
    map['work_phone'] = workPhone;
    map['office_status'] = officeStatus;
    if (shift != null) {
      map['shift'] = shift?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'WorkResponse{id: $id, branchId: $branchId, employeeId: $employeeId, shiftId: $shiftId, workdays: $workdays, departmentId: $departmentId, designationId: $designationId, jobId: $jobId, locationId: $locationId, reportingTo: $reportingTo, sourceHire: $sourceHire, payRate: $payRate, allowance: $allowance, payType: $payType, workPhone: $workPhone, officeStatus: $officeStatus, shift: $shift}';
  }
}
