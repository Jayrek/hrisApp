import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/user/user_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/personal_wrapper_response.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dioClient;

  const UserRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<PersonalWrapperResponse> getPersonalInformation({
    required String? token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/personals/myprofile.json',
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return PersonalWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
