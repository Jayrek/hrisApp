import '../../../data/model/response/change_request_wrapper_response.dart';

abstract class ChangeRequestRepository {
  Future<ChangeRequestWrapperResponse> getChangeRequestInformation({
    required String status,
    required String token,
  });
}
