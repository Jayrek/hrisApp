import '../../../data/model/response/leaves_request_response_wrapper.dart';
import '../../../data/model/response/leaves_wrapper_response.dart';

abstract class LeavesRepository {
  Future<LeavesWrapperResponse> getLeavesInformation({
    required String dateFrom,
    required String dateTo,
    required String leaveType,
    required String leaveStatus,
    required String? token,
  });

  Future<LeavesRequestResponseWrapper> setLeavesApplication({
    required String dateFrom,
    required String dateTo,
    required String leaveType,
    required String description,
    required String? token,
  });
}
