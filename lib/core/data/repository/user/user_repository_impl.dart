import 'package:rgs_hris/core/data/data_source/user/user_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/personal_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/user/user_repository.dart';

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
