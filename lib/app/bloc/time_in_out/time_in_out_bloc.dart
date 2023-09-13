import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/model/response/attendance_in_out_wrapper_response.dart';
import '../../../core/domain/manager/token_manager.dart';
import '../../../core/domain/repository/attendance/attendance_repository.dart';

part 'time_in_out_event.dart';

part 'time_in_out_state.dart';

class TimeInOutBloc extends Bloc<TimeInOutEvent, TimeInOutState> {
  final AttendanceRepository attendanceRepository;

  TimeInOutBloc({required this.attendanceRepository})
      : super(TimeInOutInitial()) {
    on<TimeInOutSet>(_onTimeInOutSet);
  }

  FutureOr<void> _onTimeInOutSet(
    TimeInOutSet event,
    Emitter<TimeInOutState> emit,
  ) async {
    emit(TimeInOutLoading());
    final tokenValue = await TokenManager.getToken();
    final response = await attendanceRepository.setTimeInOut(
      type: event.type,
      token: tokenValue,
    );
    print('_onTimeInOutSet: $response');

    emit(TimeInOutLoaded(attendanceInOutWrapperResponse: response));
  }
}
