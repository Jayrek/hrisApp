import 'package:rgs_hris/core/data/data_source/my_access/my_access_remote_data_source.dart';
import 'package:rgs_hris/core/data/dio/dio_client.dart';
import 'package:rgs_hris/core/data/model/response/wrapper_default_response.dart';
import 'package:rgs_hris/core/data/model/response/my_access_wrapper_response.dart';

class MyAccessRemoteDataSourceImpl implements MyAccessRemoteDataSource {
  final DioClient dioClient;

  const MyAccessRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<MyAccessWrapperResponse> getMyAccessInformation({
    required String token,
  }) async {
    try {
      final response =
          await dioClient.postDio('/api/accounts/myprofile.json', data: {});

      return MyAccessWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<WrapperDefaultResponse> changePassword(
      {required String? currentPassword,
      required String? newPassword,
      required String? confirmPassword,
      required String? token}) async {
    try {
      final response = await dioClient.postDio(
        '/api/accounts/changepassword.json',
        data: {
          'c_pass': currentPassword,
          'n_pass': newPassword,
          'cn_pass': confirmPassword,
        },
      );

      return WrapperDefaultResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
