import 'work_response.dart';
import 'works_employee_response.dart';
import 'works_departments_response.dart';
import 'works_designations_response.dart';
import 'works_locations_response.dart';
import 'works_branches_response.dart';
import 'works_jobs_response.dart';
import 'works_shifts_response.dart';
import 'works_pay_types_response.dart';
import 'works_hire_source_response.dart';
import 'works_working_days.dart';

class WorksDataResponse {
  WorksDataResponse({
      this.work, 
      this.employee, 
      this.departments, 
      this.designations, 
      this.locations, 
      this.branches, 
      this.jobs, 
      this.shifts, 
      this.payTypes, 
      this.hiresource, 
      this.workingDays,});

  WorksDataResponse.fromJson(dynamic json) {
    work = json['work'] != null ? WorkResponse.fromJson(json['work']) : null;
    employee = json['employee'] != null ? WorksEmployeeResponse.fromJson(json['employee']) : null;
    departments = json['departments'] != null ? WorksDepartmentsResponse.fromJson(json['departments']) : null;
    designations = json['designations'] != null ? WorksDesignationsResponse.fromJson(json['designations']) : null;
    locations = json['locations'] != null ? WorkLocationsResponse.fromJson(json['locations']) : null;
    branches = json['branches'] != null ? WorksBranchesResponse.fromJson(json['branches']) : null;
    jobs = json['jobs'] != null ? WorksJobsResponse.fromJson(json['jobs']) : null;
    shifts = json['shifts'] != null ? WorksShiftsResponse.fromJson(json['shifts']) : null;
    payTypes = json['payTypes'] != null ? WorksPayTypesResponse.fromJson(json['payTypes']) : null;
    hiresource = json['hiresource'] != null ? WorksHireSourceResponse.fromJson(json['hiresource']) : null;
    workingDays = json['workingDays'] != null ? WorksWorkingDaysResponse.fromJson(json['workingDays']) : null;
  }
  WorkResponse? work;
  WorksEmployeeResponse? employee;
  WorksDepartmentsResponse? departments;
  WorksDesignationsResponse? designations;
  WorkLocationsResponse? locations;
  WorksBranchesResponse? branches;
  WorksJobsResponse? jobs;
  WorksShiftsResponse? shifts;
  WorksPayTypesResponse? payTypes;
  WorksHireSourceResponse? hiresource;
  WorksWorkingDaysResponse? workingDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (work != null) {
      map['work'] = work?.toJson();
    }
    if (employee != null) {
      map['employee'] = employee?.toJson();
    }
    if (departments != null) {
      map['departments'] = departments?.toJson();
    }
    if (designations != null) {
      map['designations'] = designations?.toJson();
    }
    if (locations != null) {
      map['locations'] = locations?.toJson();
    }
    if (branches != null) {
      map['branches'] = branches?.toJson();
    }
    if (jobs != null) {
      map['jobs'] = jobs?.toJson();
    }
    if (shifts != null) {
      map['shifts'] = shifts?.toJson();
    }
    if (payTypes != null) {
      map['payTypes'] = payTypes?.toJson();
    }
    if (hiresource != null) {
      map['hiresource'] = hiresource?.toJson();
    }
    if (workingDays != null) {
      map['workingDays'] = workingDays?.toJson();
    }
    return map;
  }

}