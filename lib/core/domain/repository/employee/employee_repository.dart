import '../../../data/model/response/employees_wrapper_response.dart';

abstract class EmployeeRepository {
  Future<EmployeesWrapperResponse> getEmployeeInformation({
    required String? token,
  });
}
