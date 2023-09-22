import 'package:rgs_hris/core/data/data_source/performance/performance_remote_data_source.dart';
import 'package:rgs_hris/core/data/dio/dio_client.dart';
import 'package:rgs_hris/core/data/model/response/goals_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/performance_wrapper_response.dart';

class PerformanceRemoteDataSourceImpl implements PerformanceRemoteDataSource {
  final DioClient dioClient;

  const PerformanceRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<PerformanceWrapperResponse> getPerformanceInformation(
      {required String token}) async {
    try {
      final response =
          await dioClient.postDio('/api/performances/myprofile.json', data: {});

      return PerformanceWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GoalsWrapperResponse> getPerformanceGoalsInformation(
      {required String token}) async {
    try {
      final response =
          await dioClient.postDio('/api/performances/mygoals.json', data: {});

      return GoalsWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
