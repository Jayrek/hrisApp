import 'package:rgs_hris/core/data/data_source/leaves/leaves_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/leaves_request_response_wrapper.dart';

import '../../dio/dio_client.dart';
import '../../model/response/leaves_wrapper_response.dart';

class LeavesRemoteDataSourceImpl implements LeavesRemoteDataSource {
  final DioClient dioClient;

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
      final response = await dioClient.postDio(
        '/api/leaves/myprofile.json',
        data: {
          'from': dateFrom,
          'to': dateTo,
          'type': leaveType,
          'status': leaveStatus,
        },
      );

      return LeavesWrapperResponse.fromJson(response.data);
    } catch (e) {
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
      final response = await dioClient.postDio(
        '/api/leaves/add.json',
        data: {
          'date_from': dateFrom,
          'date_to': dateTo,
          'type': leaveType,
          'description': description,
        },
      );

      return LeavesRequestResponseWrapper.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
