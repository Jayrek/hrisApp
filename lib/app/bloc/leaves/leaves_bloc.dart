import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/leaves_request_response_wrapper.dart';
import 'package:rgs_hris/core/data/model/response/leaves_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/leaves/leaves_repository.dart';

import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../common/util/key_strings.dart';

part 'leaves_event.dart';

part 'leaves_state.dart';

class LeavesBloc extends Bloc<LeavesEvent, LeavesState> {
  final LeavesRepository leavesRepository;

  LeavesBloc({required this.leavesRepository}) : super(LeavesInitial()) {
    on<LeavesFetched>(_onLeavesFetched);
    on<LeavesApplicationSet>(_onLeavesApplicationSet);
  }

  FutureOr<void> _onLeavesFetched(
    LeavesFetched event,
    Emitter<LeavesState> emit,
  ) async {
    emit(LeavesLoading());
    final tokenValue =
        await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
    final responseLeave = await leavesRepository.getLeavesInformation(
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
      leaveType: event.type,
      leaveStatus: event.status,
      token: tokenValue,
    );
    print('responseLeave: $responseLeave');

    emit(LeavesLoaded(leavesWrapperResponse: responseLeave));
  }

  FutureOr<void> _onLeavesApplicationSet(
    LeavesApplicationSet event,
    Emitter<LeavesState> emit,
  ) async {
    emit(LeavesLoading());
    final tokenValue =
        await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
    final response = await leavesRepository.setLeavesApplication(
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
      leaveType: event.type,
      description: event.description,
      token: tokenValue,
    );

    print('response: $response');

    emit(LeavesSetLoaded(leavesRequestResponseWrapper: response));
  }
}
