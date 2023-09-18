import '../../model/response/goals_wrapper_response.dart';
import '../../model/response/performance_wrapper_response.dart';

abstract class PerformanceRemoteDataSource {
  Future<PerformanceWrapperResponse> getPerformanceInformation({
    required String token,
  });

  Future<GoalsWrapperResponse> getPerformanceGoalsInformation({
    required String token,
  });
}
