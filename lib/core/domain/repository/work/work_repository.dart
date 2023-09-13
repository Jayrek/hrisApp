import '../../../data/model/response/works_wrapper_response.dart';

abstract class WorkRepository {
  Future<WorksWrapperResponse> getWorkInformation({
    required String? token,
  });
}
