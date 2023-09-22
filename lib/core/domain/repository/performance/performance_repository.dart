import '../../../remote/model/response/goals_wrapper_response.dart';
import '../../../remote/model/response/performance_wrapper_response.dart';

abstract class PerformanceRepository {
  Future<PerformanceWrapperResponse> getPerformanceInformation({
    required String token,
  });

  Future<GoalsWrapperResponse> getPerformanceGoalsInformation({
    required String token,
  });
}
