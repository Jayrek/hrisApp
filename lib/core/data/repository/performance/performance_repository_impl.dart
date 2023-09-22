import 'package:rgs_hris/core/data/data_source/performance/performance_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/goals_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/performance_wrapper_response.dart';

import '../../../domain/repository/performance/performance_repository.dart';

class PerformanceRepositoryImpl implements PerformanceRepository {
  final PerformanceRemoteDataSource performanceRemoteDataSource;

  const PerformanceRepositoryImpl({required this.performanceRemoteDataSource});

  @override
  Future<GoalsWrapperResponse> getPerformanceGoalsInformation(
      {required String token}) async {
    return await performanceRemoteDataSource.getPerformanceGoalsInformation(
      token: token,
    );
  }

  @override
  Future<PerformanceWrapperResponse> getPerformanceInformation(
      {required String token}) async {
    return await performanceRemoteDataSource.getPerformanceInformation(
      token: token,
    );
  }
}
