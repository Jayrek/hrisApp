import '../../../data/model/response/my_access_wrapper_response.dart';

abstract class MyAccessRepository {
  Future<MyAccessWrapperResponse> getMyAccessInformation({
    required String token,
  });
}
