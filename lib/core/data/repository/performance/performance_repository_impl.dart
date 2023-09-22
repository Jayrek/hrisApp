import '../../../domain/repository/performance/performance_repository.dart';
import '../../../remote/data_source/performance/performance_remote_data_source.dart';
import '../../../remote/model/response/goals_wrapper_response.dart';
import '../../../remote/model/response/performance_wrapper_response.dart';

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
