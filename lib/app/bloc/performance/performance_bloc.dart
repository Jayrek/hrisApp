import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/goals_wrapper_response.dart';
import 'package:rgs_hris/core/data/model/response/performance_wrapper_response.dart';
import 'package:rgs_hris/core/domain/manager/shared_prefs_manager.dart';

import '../../../core/data/repository/performance/performance_repository_impl.dart';
import '../../common/util/key_strings.dart';

part 'performance_event.dart';

part 'performance_state.dart';

class PerformanceBloc extends Bloc<PerformanceEvent, PerformanceState> {
  final PerformanceRepositoryImpl performanceRepository;

  PerformanceBloc({required this.performanceRepository})
      : super(PerformanceInitial()) {
    on<PerformanceProfileFetched>(_onPerformanceProfileFetched);
    on<PerformanceGoalsFetched>(_onPerformanceGoalsFetched);
  }

  FutureOr<void> _onPerformanceProfileFetched(
    PerformanceProfileFetched event,
    Emitter<PerformanceState> emit,
  ) async {
    emit(PerformanceLoading());
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response = await performanceRepository.getPerformanceInformation(
          token: tokenValue);

      emit(PerformanceProfileLoaded(performanceWrapperResponse: response));
    } catch (e) {
      emit(PerformanceException(message: e.toString()));
    }
  }

  FutureOr<void> _onPerformanceGoalsFetched(
    PerformanceGoalsFetched event,
    Emitter<PerformanceState> emit,
  ) async {
    emit(PerformanceLoading());
    try {
      final tokenValue =
          await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
      final response = await performanceRepository
          .getPerformanceGoalsInformation(token: tokenValue);

      emit(PerformanceGoalsLoaded(goalsWrapperResponse: response));
    } catch (e) {
      emit(PerformanceException(message: e.toString()));
    }
  }
}
