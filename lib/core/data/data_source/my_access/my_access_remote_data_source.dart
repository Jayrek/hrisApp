import '../../model/response/change_password_wrapper_response.dart';
import '../../model/response/my_access_wrapper_response.dart';

abstract class MyAccessRemoteDataSource {
  Future<MyAccessWrapperResponse> getMyAccessInformation(
      {required String token});

  Future<ChangePasswordWrapperResponse> changePassword({
    required String? currentPassword,
    required String? newPassword,
    required String? confirmPassword,
    required String? token,
  });
}
