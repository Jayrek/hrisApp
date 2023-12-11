import '../../../domain/repository/auth/auth_repository.dart';
import '../../../remote/data_source/auth/auth_remote_data_source.dart';
import '../../../remote/model/response/login_wrapper_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<LoginWrapperResponse> signInUser(
      {required String username, required String password}) async {
    return await authRemoteDataSource.signInUser(
      username: username,
      password: password,
    );
  }
}
