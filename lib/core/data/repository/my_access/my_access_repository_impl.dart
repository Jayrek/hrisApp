import '../../../domain/repository/my_access/my_access_repository.dart';
import '../../../remote/data_source/my_access/my_access_remote_data_source.dart';
import '../../../remote/model/response/my_access_wrapper_response.dart';
import '../../../remote/model/response/wrapper_default_response.dart';

class MyAccessRepositoryImpl implements MyAccessRepository {
  final MyAccessRemoteDataSource myAccessRemoteDataSource;

  const MyAccessRepositoryImpl({required this.myAccessRemoteDataSource});

  @override
  Future<MyAccessWrapperResponse> getMyAccessInformation({
    required String token,
  }) async {
    return await myAccessRemoteDataSource.getMyAccessInformation(
      token: token,
    );
  }

  @override
  Future<WrapperDefaultResponse> changePassword(
      {required String? currentPassword,
      required String? newPassword,
      required String? confirmPassword,
      required String? token}) async {
    return await myAccessRemoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
      token: token,
    );
  }
}
