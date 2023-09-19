import '../../../data/model/response/change_request_wrapper_response.dart';
import '../../../data/model/response/wrapper_default_response.dart';

abstract class ChangeRequestRepository {
  Future<ChangeRequestWrapperResponse> getChangeRequestInformation({
    required String status,
    required String token,
  });

  Future<WrapperDefaultResponse> setChangeRequest({
    required String category,
    required String oldData,
    required String newData,
    required String token,
  });
}
