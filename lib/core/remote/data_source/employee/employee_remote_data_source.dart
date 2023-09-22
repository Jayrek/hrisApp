import '../../../remote/model/response/employees_wrapper_response.dart';

abstract class EmployeeRemoteDataSource {
  Future<EmployeesWrapperResponse> getEmployeeInformation({
    required String? token,
  });
}
