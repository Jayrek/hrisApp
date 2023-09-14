import 'package:rgs_hris/core/data/data_source/work/work_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/works_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/work/work_repository.dart';

class WorkRepositoryImpl implements WorkRepository {
  final WorkRemoteDataSource workRemoteDataSource;

  const WorkRepositoryImpl({required this.workRemoteDataSource});

  @override
  Future<WorksWrapperResponse> getWorkInformation({
    required String? token,
  }) async {
    return await workRemoteDataSource.getWorkInformation(token: token);
  }
}
