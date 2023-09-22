import '../../../data/model/response/works_wrapper_response.dart';

abstract class WorkRemoteDataSource {
  Future<WorksWrapperResponse> getWorkInformation({
    required String? token,
  });
}
