import 'package:rgs_hris/core/data/data_source/work/work_remote_data_source.dart';
import 'package:rgs_hris/core/data/dio/dio_client.dart';
import 'package:rgs_hris/core/data/model/response/works_wrapper_response.dart';

class WorkRemoteDataSourceImpl implements WorkRemoteDataSource {
  final DioClient dioClient;

  const WorkRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<WorksWrapperResponse> getWorkInformation({
    required String? token,
  }) async {
    try {
      final response =
          await dioClient.postDio('/api/works/myprofile.json', data: {});

      return WorksWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
