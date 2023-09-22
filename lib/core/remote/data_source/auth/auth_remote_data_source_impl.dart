import '../../../data/model/response/login_wrapper_response.dart';
import '../../dio/dio_client.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  const AuthRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LoginWrapperResponse> signInUser(
      {required String username, required String password}) async {
    try {
      final response = await dioClient.postDio(
        '/api/accounts/login.json',
        data: {
          'username': username,
          'password': password,
        },
      );

      return LoginWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
