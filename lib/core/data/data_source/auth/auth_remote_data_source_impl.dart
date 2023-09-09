import 'package:rgs_hris/core/data/dio/dio_client.dart';
import 'package:rgs_hris/core/data/model/response/login_response.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  const AuthRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<LoginResponse> signInUser(
      {required String username, required String password}) async {
    final response = await dioClient
        .postDio('/api/accounts/login.json', {'username': username, 'password': password});

    return LoginResponse.fromJson(response.data);
  }
}