import '../../../data/model/response/attendance_wrapper_response.dart';

abstract class AttendanceRepository {
  Future<AttendanceWrapperResponse> getAttendanceInfo({
    required String dateFrom,
    required String dateTo,
    required String? token,
  });
}
