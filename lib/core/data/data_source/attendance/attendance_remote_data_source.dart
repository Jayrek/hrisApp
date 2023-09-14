import '../../model/response/attendance_in_out_wrapper_response.dart';
import '../../model/response/attendance_wrapper_response.dart';

abstract class AttendanceRemoteDataSource {
  Future<AttendanceWrapperResponse> getAttendanceInfo({
    required String dateFrom,
    required String dateTo,
    required String? token,
  });

  Future<AttendanceInOutWrapperResponse> setTimeInOut({
    required String type,
    required String? token,
  });
}
