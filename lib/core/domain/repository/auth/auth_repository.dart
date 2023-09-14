import '../../../data/model/response/login_wrapper_response.dart';

abstract class AuthRepository {
  Future<LoginWrapperResponse> signInUser({
    required String username,
    required String password,
  });
}
