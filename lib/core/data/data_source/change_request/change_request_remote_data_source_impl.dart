import 'package:rgs_hris/core/data/data_source/change_request/change_request_remote_data_source.dart';
import 'package:rgs_hris/core/data/dio/dio_client.dart';
import 'package:rgs_hris/core/data/model/response/change_request_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/wrapper_default_response.dart';

class ChangeRequestRemoteDataSourceImpl
    implements ChangeRequestRemoteDataSource {
  final DioClient dioClient;

  const ChangeRequestRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<ChangeRequestWrapperResponse> getChangeRequestInformation({
    required String status,
    required String token,
  }) async {
    try {
      final response = await dioClient.postDio(
        '/api/changerequests/viewrequests.json',
        data: {
          'status': status,
        },
      );

      return ChangeRequestWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<WrapperDefaultResponse> setChangeRequest({
    required String category,
    required String oldData,
    required String newData,
    required String token,
  }) async {
    try {
      final response = await dioClient.postDio(
        '/api/changerequests/add.json',
        data: {
          'category': category,
          'old_data': oldData,
          'new_data': newData,
        },
      );

      return WrapperDefaultResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
