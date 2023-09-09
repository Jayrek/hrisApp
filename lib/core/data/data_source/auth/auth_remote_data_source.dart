import '../../model/response/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> signInUser({
    required String username,
    required String password,
  });
}
