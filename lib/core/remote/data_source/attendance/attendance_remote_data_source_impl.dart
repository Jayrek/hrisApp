import '../../../remote/model/response/attendance_in_out_wrapper_response.dart';
import '../../../remote/model/response/attendance_wrapper_response.dart';
import '../../dio/dio_client.dart';
import 'attendance_remote_data_source.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final DioClient dioClient;

  const AttendanceRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<AttendanceWrapperResponse> getAttendanceInfo({
    required String dateFrom,
    required String dateTo,
    required String token,
  }) async {
    try {
      final response = await dioClient.postDio(
        '/api/attendances/myprofile.json',
        data: {
          'from': dateFrom,
          'to': dateTo,
        },
      );

      return AttendanceWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AttendanceInOutWrapperResponse> setTimeInOut({
    required String type,
    required String token,
  }) async {
    try {
      final response = await dioClient.postDio(
        '/api/attendances/timein.json',
        data: {
          'type': type,
        },
      );

      return AttendanceInOutWrapperResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
