import '../../../domain/repository/change_request/change_request_repository.dart';
import '../../../remote/data_source/change_request/change_request_remote_data_source.dart';
import '../../model/response/change_request_wrapper_response.dart';
import '../../model/response/wrapper_default_response.dart';

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

  @override
  Future<WrapperDefaultResponse> setChangeRequest({
    required String category,
    required String oldData,
    required String newData,
    required String token,
  }) async {
    return await changeRequestRemoteDataSource.setChangeRequest(
      category: category,
      oldData: oldData,
      newData: newData,
      token: token,
    );
  }
}
