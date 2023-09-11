import 'package:rgs_hris/core/data/data_source/leaves/leaves_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/leaves_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/leaves/leaves_repository.dart';

class LeavesRepositoryImpl implements LeavesRepository {
  final LeavesRemoteDataSource leavesRemoteDataSource;

  const LeavesRepositoryImpl({required this.leavesRemoteDataSource});

  @override
  Future<LeavesWrapperResponse> getLeavesInformation(
      {required String dateFrom,
      required String dateTo,
      required String leaveType,
      required String leaveStatus,
      required String token,
      }) async {
    return await leavesRemoteDataSource.getLeavesInformation(
      dateFrom: dateFrom,
      dateTo: dateTo,
      leaveType: leaveType,
      leaveStatus: leaveStatus,
      token: token,
    );
  }
}
