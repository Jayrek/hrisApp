import '../../../data/model/response/my_access_wrapper_response.dart';
import '../../../data/model/response/wrapper_default_response.dart';

abstract class MyAccessRemoteDataSource {
  Future<MyAccessWrapperResponse> getMyAccessInformation(
      {required String token});

  Future<WrapperDefaultResponse> changePassword({
    required String? currentPassword,
    required String? newPassword,
    required String? confirmPassword,
    required String? token,
  });
}
