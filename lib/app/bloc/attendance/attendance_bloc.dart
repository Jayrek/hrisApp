import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rgs_hris/core/domain/manager/shared_prefs_manager.dart';
import 'package:rgs_hris/core/data/model/response/attendance_in_out_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/attendance_wrapper_response.dart';

import '../../../core/domain/manager/token_manager.dart';
import '../../../core/domain/repository/attendance/attendance_repository.dart';

part 'attendance_event.dart';

part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository attendanceRepository;

  AttendanceBloc({required this.attendanceRepository})
      : super(AttendanceInitial()) {
    on<AttendanceFetched>(_onAttendanceFetched);
    // on<AttendanceTimeInOutSet>(_onAttendanceTimeInOutSet);
  }

  FutureOr<void> _onAttendanceFetched(
    AttendanceFetched event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(AttendanceLoading());
    // final tokenValue = await TokenManager.getToken();
    final tokenValue = await SharedPrefsManager().getToken();
    final response = await attendanceRepository.getAttendanceInfo(
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
      token: tokenValue,
    );
    print('response: $response');

    emit(AttendanceLoaded(attendanceWrapperResponse: response));
  }

// FutureOr<void> _onAttendanceTimeInOutSet(
//   AttendanceTimeInOutSet event,
//   Emitter<AttendanceState> emit,
// ) async {
//   emit(AttendanceSetLoading());
//   final tokenValue = await TokenManager.getToken();
//   final response = await attendanceRepository.setTimeInOut(
//     type: event.type,
//     token: tokenValue,
//   );
//   print('_onAttendanceTimeInOutSet: $response');
//
//   emit(AttendanceTimeInOutLoaded(attendanceInOutWrapperResponse: response));
// }
}
