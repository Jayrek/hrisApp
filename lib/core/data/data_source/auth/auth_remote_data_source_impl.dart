import 'package:dio/dio.dart';
import '../../model/response/login_wrapper_response.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // final DioClient dioClient;
  final Dio dioClient;

  const AuthRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<LoginWrapperResponse> signInUser(
      {required String username, required String password}) async {
    // final response = await dioClient.postDio('/api/accounts/login.json',
    //     {'username': username, 'password': password});

    try {
      // final response = await dioClient.postDio(
      //   '/api/leaves/myprofile.json',
      final response = await dioClient.post(
        'https://demo.calisg.com/hris/api/api/accounts/login.json',
        data: {'username': username, 'password': password},
      );

      return LoginWrapperResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('e: ${e.toString()}');
      throw Exception(e);
    }
  }
}
