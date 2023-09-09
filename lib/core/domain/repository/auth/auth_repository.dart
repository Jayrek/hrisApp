import '../../../data/model/response/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> signInUser({
    required String username,
    required String password,
  });
}
