import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/leaves_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/leaves/leaves_repository.dart';

import '../../../core/domain/manager/token_manager.dart';

part 'leaves_event.dart';

part 'leaves_state.dart';

class LeavesBloc extends Bloc<LeavesEvent, LeavesState> {
  final LeavesRepository leavesRepository;

  LeavesBloc({required this.leavesRepository}) : super(LeavesInitial()) {
    on<LeavesFetched>(_leavesProfileFetched);
  }

  FutureOr<void> _leavesProfileFetched(
    LeavesFetched event,
    Emitter<LeavesState> emit,
  ) async {
    emit(LeavesLoading());
    final tokenValue = await TokenManager.getToken();
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
}
