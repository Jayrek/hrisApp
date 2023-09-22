import '../../../domain/repository/leaves/leaves_repository.dart';
import '../../../remote/data_source/leaves/leaves_remote_data_source.dart';
import '../../model/response/leaves_request_response_wrapper.dart';
import '../../model/response/leaves_wrapper_response.dart';

class LeavesRepositoryImpl implements LeavesRepository {
  final LeavesRemoteDataSource leavesRemoteDataSource;

  const LeavesRepositoryImpl({required this.leavesRemoteDataSource});

  @override
  Future<LeavesWrapperResponse> getLeavesInformation({
    required String dateFrom,
    required String dateTo,
    required String leaveType,
    required String leaveStatus,
    required String? token,
  }) async {
    return await leavesRemoteDataSource.getLeavesInformation(
      dateFrom: dateFrom,
      dateTo: dateTo,
      leaveType: leaveType,
      leaveStatus: leaveStatus,
      token: token,
    );
  }

  @override
  Future<LeavesRequestResponseWrapper> setLeavesApplication({
    required String dateFrom,
    required String dateTo,
    required String leaveType,
    required String description,
    required String? token,
  }) async {
    return await leavesRemoteDataSource.setLeavesApplication(
      dateFrom: dateFrom,
      dateTo: dateTo,
      leaveType: leaveType,
      description: description,
      token: token,
    );
  }
}
