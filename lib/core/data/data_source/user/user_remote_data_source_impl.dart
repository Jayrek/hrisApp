import 'package:rgs_hris/core/data/data_source/user/user_remote_data_source.dart';
import 'package:rgs_hris/core/data/dio/dio_client.dart';
import 'package:rgs_hris/core/data/model/response/personal_wrapper_response.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient dioClient;

  const UserRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<PersonalWrapperResponse> getPersonalInformation({
    required String? token,
  }) async {
    try {
      final response =
          await dioClient.postDio('/api/personals/myprofile.json', data: {});

      return PersonalWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
