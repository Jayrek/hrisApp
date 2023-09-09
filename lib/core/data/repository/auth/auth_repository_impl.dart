import 'package:rgs_hris/core/data/data_source/auth/auth_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/login_response.dart';

import '../../../domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<LoginResponse> signInUser(
      {required String username, required String password}) async {
    return await authRemoteDataSource.signInUser(
      username: username,
      password: password,
    );
  }
}
