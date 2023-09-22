import '../../../domain/repository/employee/employee_repository.dart';
import '../../../remote/data_source/employee/employee_remote_data_source.dart';
import '../../model/response/employees_wrapper_response.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource employeeRemoteDataSource;

  const EmployeeRepositoryImpl({required this.employeeRemoteDataSource});

  @override
  Future<EmployeesWrapperResponse> getEmployeeInformation({
    required String? token,
  }) async {
    return await employeeRemoteDataSource.getEmployeeInformation(token: token);
  }
}
