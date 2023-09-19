import '../../../data/model/response/change_password_wrapper_response.dart';
import '../../../data/model/response/my_access_wrapper_response.dart';

abstract class MyAccessRepository {
  Future<MyAccessWrapperResponse> getMyAccessInformation({
    required String token,
  });

  Future<ChangePasswordWrapperResponse> changePassword({
    required String? currentPassword,
    required String? newPassword,
    required String? confirmPassword,
    required String? token,
  });
}
