import '../../model/response/change_request_wrapper_response.dart';

abstract class ChangeRequestRemoteDataSource {
  Future<ChangeRequestWrapperResponse> getChangeRequestInformation({
    required String status,
    required String token,
  });
}
