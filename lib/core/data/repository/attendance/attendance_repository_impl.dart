import 'package:rgs_hris/core/data/data_source/attendance/attendance_remote_data_source.dart';
import 'package:rgs_hris/core/data/model/response/attendance_in_out_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/attendance_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/attendance/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource attendanceRemoteDataSource;

  const AttendanceRepositoryImpl({required this.attendanceRemoteDataSource});

  @override
  Future<AttendanceWrapperResponse> getAttendanceInfo({
    required String dateFrom,
    required String dateTo,
    required String token,
  }) async {
    return await attendanceRemoteDataSource.getAttendanceInfo(
      dateFrom: dateFrom,
      dateTo: dateTo,
      token: token,
    );
  }

  @override
  Future<AttendanceInOutWrapperResponse> setTimeInOut({
    required String type,
    required String token,
  }) async {
    return await attendanceRemoteDataSource.setTimeInOut(
      type: type,
      token: token,
    );
  }
}
