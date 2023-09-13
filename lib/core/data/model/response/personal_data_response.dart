import 'personal_employee_response.dart';
import 'personal_address_response.dart';

class PersonalDataResponse {
  PersonalDataResponse({
    this.employee,
    this.address,
  });

  PersonalDataResponse.fromJson(dynamic json) {
    employee = json['employee'] != null
        ? PersonalEmployeeResponse.fromJson(json['employee'])
        : null;
    address =
        json['address'] != null ? PersonalAddressResponse.fromJson(json['address']) : null;
  }

  PersonalEmployeeResponse? employee;
  PersonalAddressResponse? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (employee != null) {
      map['employee'] = employee?.toJson();
    }
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'PersonalDataResponse{employee: $employee, address: $address}';
  }
}
