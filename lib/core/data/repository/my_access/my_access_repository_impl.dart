import 'package:rgs_hris/core/data/data_source/my_access/my_access_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/my_access_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/my_access/my_access_repository.dart';

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
}
