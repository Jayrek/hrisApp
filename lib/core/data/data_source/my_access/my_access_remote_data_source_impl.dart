import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/my_access/my_access_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/my_access_wrapper_response.dart';

class MyAccessRemoteDataSourceImpl implements MyAccessRemoteDataSource {
  final Dio dioClient;

  const MyAccessRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<MyAccessWrapperResponse> getMyAccessInformation({
    required String token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/accounts/myprofile.json',
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return MyAccessWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
