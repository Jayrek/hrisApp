import '../../../domain/repository/user/user_repository.dart';
import '../../../remote/data_source/user/user_remote_data_source.dart';
import '../../model/response/personal_wrapper_response.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  const UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<PersonalWrapperResponse> getPersonalInformation({
    required String? token,
  }) async {
    return await userRemoteDataSource.getPersonalInformation(
      token: token,
    );
  }
}
