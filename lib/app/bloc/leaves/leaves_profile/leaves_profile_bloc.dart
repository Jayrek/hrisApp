import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/leaves_wrapper_response.dart';
import 'package:rgs_hris/core/domain/repository/leaves/leaves_repository.dart';

import '../../../../core/domain/manager/token_manager.dart';

part 'leaves_profile_event.dart';

part 'leaves_profile_state.dart';

class LeavesProfileBloc extends Bloc<LeavesProfileEvent, LeavesProfileState> {
  final LeavesRepository leavesRepository;

  LeavesProfileBloc({required this.leavesRepository})
      : super(LeavesProfileInitial()) {
    on<LeavesProfileFetched>(_leavesProfileFetched);
  }

  FutureOr<void> _leavesProfileFetched(
    LeavesProfileFetched event,
    Emitter<LeavesProfileState> emit,
  ) async {
    emit(LeavesProfileLoading());
    final tokenValue = await TokenManager.getToken();
    final responseLeave = await leavesRepository.getLeavesInformation(
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
      leaveType: event.type,
      leaveStatus: event.status,
      token: tokenValue,
    );

    emit(LeavesProfileLoaded(leavesWrapperResponse: responseLeave));

  }
}
