import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgs_hris/core/data/data_source/attendance/attendance_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/attendance_in_out_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/attendance_wrapper_response.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final Dio dioClient;

  const AttendanceRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<AttendanceWrapperResponse> getAttendanceInfo({
    required String dateFrom,
    required String dateTo,
    required String? token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/attendances/myprofile.json',
          data: FormData.fromMap({
            'from': dateFrom,
            'to': dateTo,
          }),
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return AttendanceWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AttendanceInOutWrapperResponse> setTimeInOut({
    required String type,
    required String? token,
  }) async {
    try {
      final response = await dioClient.post(
          'https://demo.calisg.com/hris/api/api/attendances/timein.json',
          data: FormData.fromMap({
            'type': type,
          }),
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      return AttendanceInOutWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
