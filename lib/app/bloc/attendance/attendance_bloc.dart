import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/model/response/attendance_wrapper_response.dart';
import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../../core/domain/repository/attendance/attendance_repository.dart';
import '../../common/util/key_strings.dart';

part 'attendance_event.dart';

part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository attendanceRepository;

  AttendanceBloc({required this.attendanceRepository})
      : super(AttendanceInitial()) {
    on<AttendanceFetched>(_onAttendanceFetched);
  }

  FutureOr<void> _onAttendanceFetched(
    AttendanceFetched event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(AttendanceLoading());
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response = await attendanceRepository.getAttendanceInfo(
        dateFrom: event.dateFrom,
        dateTo: event.dateTo,
        token: tokenValue,
      );

      emit(AttendanceLoaded(attendanceWrapperResponse: response));
    } catch (e) {
      emit(AttendanceException(message: e.toString()));
    }
  }
}
