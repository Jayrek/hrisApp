import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/employee/employee_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/employees_wrapper_response.dart';

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final Dio dioClient;

  const EmployeeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<EmployeesWrapperResponse> getEmployeeInformation({
    required String? token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/employees/myprofile.json',
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return EmployeesWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
