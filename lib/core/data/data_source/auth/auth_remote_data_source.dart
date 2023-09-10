import 'package:rgs_hris/core/data/model/response/login_wrapper_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginWrapperResponse> signInUser({
    required String username,
    required String password,
  });
}
