import 'package:rgs_hris/core/data/data_source/employee/employee_remote_data_source.dart';
import 'package:rgs_hris/core/data/dio/dio_client.dart';
import 'package:rgs_hris/core/data/model/response/employees_wrapper_response.dart';

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final DioClient dioClient;

  const EmployeeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<EmployeesWrapperResponse> getEmployeeInformation({
    required String? token,
  }) async {
    try {
      final response =
          await dioClient.postDio('/api/employees/myprofile.json', data: {});

      return EmployeesWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
