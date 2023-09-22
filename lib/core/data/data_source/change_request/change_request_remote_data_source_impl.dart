import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/change_request/change_request_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/change_request_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/wrapper_default_response.dart';

class ChangeRequestRemoteDataSourceImpl
    implements ChangeRequestRemoteDataSource {
  final Dio dioClient;

  const ChangeRequestRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<ChangeRequestWrapperResponse> getChangeRequestInformation({
    required String status,
    required String token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/changerequests/viewrequests.json',
          data: FormData.fromMap(
            {
              'status': status,
            },
          ),
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return ChangeRequestWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<WrapperDefaultResponse> setChangeRequest({
    required String category,
    required String oldData,
    required String newData,
    required String token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/changerequests/add.json',
          data: FormData.fromMap(
            {
              'category': category,
              'old_data': oldData,
              'new_data': newData,
            },
          ),
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return WrapperDefaultResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
