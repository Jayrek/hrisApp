import 'package:rgs_hris/core/data/data_source/change_request/change_request_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/change_request_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/change_request/change_request_repository.dart';

class ChangeRequestRepositoryImpl implements ChangeRequestRepository {
  final ChangeRequestRemoteDataSource changeRequestRemoteDataSource;

  const ChangeRequestRepositoryImpl(
      {required this.changeRequestRemoteDataSource});

  @override
  Future<ChangeRequestWrapperResponse> getChangeRequestInformation({
    required String status,
    required String token,
  }) async {
    return await changeRequestRemoteDataSource.getChangeRequestInformation(
      status: status,
      token: token,
    );
  }
}
