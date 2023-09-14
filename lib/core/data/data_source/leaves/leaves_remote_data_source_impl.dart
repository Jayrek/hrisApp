import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/leaves/leaves_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/leaves_request_response_wrapper.dart';

import '../../model/response/leaves_wrapper_response.dart';

class LeavesRemoteDataSourceImpl implements LeavesRemoteDataSource {
  // final DioClient dioClient;

  final Dio dioClient;

  const LeavesRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LeavesWrapperResponse> getLeavesInformation({
    required String dateFrom,
    required String dateTo,
    required String leaveType,
    required String leaveStatus,
    required String? token,
  }) async {
    try {
      // final loginResponse = await dioClient.post(
      //   'https://demo.calisg.com/hris/api/api/accounts/login.json',
      //   data: {'username': 'CRUZ06061988', 'password': '06061988'},
      // );
      //
      // final login = LoginWrapperResponse.fromJson(loginResponse.data);

      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/leaves/myprofile.json',
          data: FormData.fromMap({
            'from': dateFrom,
            'to': dateTo,
            'type': leaveType,
            'status': leaveStatus
          }),
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return LeavesWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<LeavesRequestResponseWrapper> setLeavesApplication({
    required String dateFrom,
    required String dateTo,
    required String leaveType,
    required String description,
    required String? token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/leaves/add.json',
          data: FormData.fromMap({
            'date_from': dateFrom,
            'date_to': dateTo,
            'type': leaveType,
            'description': description
          }),
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return LeavesRequestResponseWrapper.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
