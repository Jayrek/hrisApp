import '../../../remote/model/response/employees_wrapper_response.dart';
import '../../dio/dio_client.dart';
import 'employee_remote_data_source.dart';

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
