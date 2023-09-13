import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/work/work_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/works_wrapper_response.dart';

class WorkRemoteDataSourceImpl implements WorkRemoteDataSource {
  final Dio dioClient;

  const WorkRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<WorksWrapperResponse> getWorkInformation({
    required String? token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/works/myprofile.json',
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return WorksWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
