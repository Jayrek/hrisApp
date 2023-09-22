import '../../../data/model/response/personal_wrapper_response.dart';
import '../../dio/dio_client.dart';
import 'user_remote_data_source.dart';

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
