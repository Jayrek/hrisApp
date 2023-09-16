import '../../model/response/my_access_wrapper_response.dart';

abstract class MyAccessRemoteDataSource {
  Future<MyAccessWrapperResponse> getMyAccessInformation(
      {required String token});
}
