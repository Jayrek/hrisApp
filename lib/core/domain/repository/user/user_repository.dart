import '../../../data/model/response/personal_wrapper_response.dart';

abstract class UserRepository {
  Future<PersonalWrapperResponse> getPersonalInformation({
    required String? token,
  });
}
