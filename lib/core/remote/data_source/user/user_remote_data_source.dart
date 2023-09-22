import '../../../data/model/response/personal_wrapper_response.dart';

abstract class UserRemoteDataSource {
  Future<PersonalWrapperResponse> getPersonalInformation({
    required String? token,
  });
}
