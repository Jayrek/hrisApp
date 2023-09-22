import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/performance/performance_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/goals_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/performance_wrapper_response.dart';

class PerformanceRemoteDataSourceImpl implements PerformanceRemoteDataSource {
  final Dio dioClient;

  const PerformanceRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<PerformanceWrapperResponse> getPerformanceInformation(
      {required String token}) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/performances/myprofile.json',
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return PerformanceWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GoalsWrapperResponse> getPerformanceGoalsInformation(
      {required String token}) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/performances/mygoals.json',
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return GoalsWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
